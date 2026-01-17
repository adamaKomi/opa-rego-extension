# Complex Rules Test
# This file tests advanced Rego patterns

package test.complex

import future.keywords.if
import future.keywords.in
import future.keywords.every
import future.keywords.contains

import data.users
import data.permissions as perms

# Nested rule with comprehension
allowed_resources contains resource if {
    some resource in input.resources
    resource.public == true
}

allowed_resources contains resource if {
    some resource in input.resources
    some permission in input.user.permissions
    permission.resource_id == resource.id
    permission.action == "read"
}

# Rule with else
access_level := "admin" if {
    "admin" in input.user.roles
} else := "user" if {
    "user" in input.user.roles
} else := "guest"

# Object rule
user_permissions[user] := permissions if {
    some user in data.users
    permissions := [p | 
        some p in data.permissions
        p.user_id == user.id
    ]
}

# Every quantifier
all_items_valid if {
    every item in input.items {
        item.status == "active"
        item.value > 0
    }
}

# With keyword for mocking
test_allow_admin if {
    allow with input as {"user": {"roles": ["admin"]}}
}

# Complex comprehension with multiple conditions
filtered_data := [item |
    some item in input.data
    item.type == "important"
    item.priority >= 5
    not item.archived
]

# Object comprehension
role_map := {role: users |
    some role in data.roles
    users := [u.name | some u in data.users; role in u.roles]
}
