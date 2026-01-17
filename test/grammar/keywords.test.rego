# SYNTAX TEST "source.rego" "Rego Keywords Test"

package test.keywords
# <-- keyword.control.package.rego
#       ^^^^^^^^^^^^^ entity.name.namespace.rego

import future.keywords.if
# <--- keyword.control.import.rego
#      ^^^^^^^^^^^^^^^^^^ entity.name.import.rego

import data.module as mod
# <--- keyword.control.import.rego
#                  ^^ keyword.control.as.rego
#                     ^^^ entity.name.alias.rego

default allow := false
# <---- keyword.control.rego
#       ^^^^^ entity.name.function.rule.rego
#             ^^ keyword.operator.assignment.rego
#                ^^^^^ constant.language.boolean.rego

allow if {
#     ^^ keyword.control.rego
    some x in input.items
#   ^^^^ keyword.control.rego
#      ^ - not highlighted as keyword
#        ^^ keyword.control.rego
    not denied
#   ^^^ keyword.control.rego
}

result := value if {
#      ^^ keyword.operator.assignment.rego
#                ^^ keyword.control.rego
    condition
} else := other
# ^^^^ keyword.control.rego
#      ^^ keyword.operator.assignment.rego

every item in collection {
# ^^^ keyword.control.rego
#          ^^ keyword.control.rego
    item.valid
}

rule contains element if {
#    ^^^^^^^^ keyword.control.rego
    true
}

check with input as mock_input
#     ^^^^ keyword.control.rego
#               ^^ keyword.control.rego
