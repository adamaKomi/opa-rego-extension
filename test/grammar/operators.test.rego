# SYNTAX TEST "source.rego" "Rego Operators Test"

package test.operators

# Assignment operators
val1 := "assigned"
#    ^^ keyword.operator.assignment.rego

val2 = "unified"
#    ^ keyword.operator.assignment.rego

# Comparison operators
cmp1 := x == y
#         ^^ keyword.operator.comparison.rego

cmp2 := x != y
#         ^^ keyword.operator.comparison.rego

cmp3 := x < y
#         ^ keyword.operator.comparison.rego

cmp4 := x > y
#         ^ keyword.operator.comparison.rego

cmp5 := x <= y
#         ^^ keyword.operator.comparison.rego

cmp6 := x >= y
#         ^^ keyword.operator.comparison.rego

# Arithmetic operators
arith1 := a + b
#           ^ keyword.operator.arithmetic.rego

arith2 := a - b
#           ^ keyword.operator.arithmetic.rego

arith3 := a * b
#           ^ keyword.operator.arithmetic.rego

arith4 := a / b
#           ^ keyword.operator.arithmetic.rego

arith5 := a % b
#           ^ keyword.operator.arithmetic.rego

# Logical operators
logic1 := set1 & set2
#              ^ keyword.operator.logical.rego

logic2 := set1 | set2
#              ^ keyword.operator.logical.rego
