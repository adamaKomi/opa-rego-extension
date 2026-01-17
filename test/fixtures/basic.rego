# Basic Rego Syntax Test
# This file tests fundamental Rego syntax highlighting

package test.basic

import future.keywords.if
import future.keywords.in

# Default rule
default allow := false

# Simple rule
allow if {
    input.user == "admin"
}

# Rule with multiple conditions
deny if {
    not input.authenticated
    input.path == "/admin"
}

# Variables and assignments
user_name := input.user.name
user_age := 25
is_adult := user_age >= 18

# String operations
greeting := concat(" ", ["Hello", user_name])

# Boolean values
enabled := true
disabled := false
nothing := null

# Numbers
count_value := 42
price := 19.99
scientific := 1.5e10
