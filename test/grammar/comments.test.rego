# SYNTAX TEST "source.rego" "Rego Comments Test"

# This is a comment
# <- comment.line.number-sign.rego

package test.comments # inline comment
#                     ^^^^^^^^^^^^^^^^ comment.line.number-sign.rego

# Comment with special chars: @#$%^&*()
# <- comment.line.number-sign.rego

rule if {
    # Comment inside rule
#   ^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.rego
    true
}

# Comment with code: x := 1 + 2
# The above should all be comment, not parsed as code
# <- comment.line.number-sign.rego

##############################
# Section header style comment
##############################
# <- comment.line.number-sign.rego

# TODO: implement this
# FIXME: broken code
# NOTE: important note
# <- comment.line.number-sign.rego
