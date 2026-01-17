# Authorization Example (RBAC + ABAC)
# Real-world authorization policy example

package ecmo.authz

import future.keywords.if
import future.keywords.in
import future.keywords.contains
import future.keywords.every

# Default deny
default allow := false

# Role definitions
admin_roles := {"super_admin", "admin", "system"}
user_roles := {"user", "member", "guest"}

# Permission mappings
role_permissions := {
    "super_admin": ["*"],
    "admin": ["read", "write", "delete", "manage_users"],
    "user": ["read", "write"],
    "member": ["read"],
    "guest": ["read"]
}

# RBAC: Role-based access
allow if {
    # Check if user has required role
    some role in input.user.roles
    role in admin_roles
}

allow if {
    # Check role permissions
    some role in input.user.roles
    some permission in role_permissions[role]
    permission == "*"
}

allow if {
    some role in input.user.roles
    some permission in role_permissions[role]
    permission == input.action
}

# ABAC: Attribute-based access
allow if {
    # Owner can always access their resources
    input.user.id == input.resource.owner_id
    input.action in ["read", "write", "delete"]
}

allow if {
    # Department-based access
    input.user.department == input.resource.department
    input.action == "read"
}

allow if {
    # Time-based access (business hours)
    input.context.hour >= 9
    input.context.hour < 17
    input.context.weekday in ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    "business_hours_only" in input.resource.tags
}

# Deny rules (explicit denials)
deny if {
    # Suspended users are always denied
    input.user.status == "suspended"
}

deny if {
    # Deny access to archived resources
    input.resource.archived == true
    not "admin" in input.user.roles
}

# Helper rules
is_admin if {
    some role in input.user.roles
    role in admin_roles
}

is_resource_owner if {
    input.user.id == input.resource.owner_id
}

# Audit logging
audit_decision contains entry if {
    entry := {
        "timestamp": time.now_ns(),
        "user": input.user.id,
        "action": input.action,
        "resource": input.resource.id,
        "allowed": allow,
        "reason": decision_reason
    }
}

decision_reason := "admin_role" if {
    is_admin
} else := "owner" if {
    is_resource_owner
} else := "permission_granted" if {
    allow
} else := "denied"

# Tests
test_admin_allowed if {
    allow with input as {
        "user": {"id": "u1", "roles": ["admin"], "status": "active"},
        "action": "delete",
        "resource": {"id": "r1", "owner_id": "u2"}
    }
}

test_owner_allowed if {
    allow with input as {
        "user": {"id": "u1", "roles": ["user"], "status": "active"},
        "action": "write",
        "resource": {"id": "r1", "owner_id": "u1"}
    }
}

test_suspended_denied if {
    deny with input as {
        "user": {"id": "u1", "roles": ["admin"], "status": "suspended"},
        "action": "read",
        "resource": {"id": "r1"}
    }
}
