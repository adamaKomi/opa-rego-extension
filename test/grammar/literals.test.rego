# SYNTAX TEST "source.rego" "Rego Literals Test"

package test.literals

# Strings
str1 := "hello world"
#       ^^^^^^^^^^^^^ string.quoted.double.rego

str2 := "escaped \"quotes\" here"
#       ^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.rego
#                ^^ constant.character.escape.rego
#                         ^^ constant.character.escape.rego

str3 := "newline\nand\ttab"
#               ^^ constant.character.escape.rego
#                   ^^ constant.character.escape.rego

# Raw strings
raw1 := `raw string with "quotes"`
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.raw.rego

raw2 := `multi
line
raw string`
# <- string.quoted.raw.rego

# Numbers - integers
int1 := 42
#       ^^ constant.numeric.integer.rego

int2 := 0
#       ^ constant.numeric.integer.rego

int3 := 123456789
#       ^^^^^^^^^ constant.numeric.integer.rego

# Numbers - floats
float1 := 3.14
#         ^^^^ constant.numeric.float.rego

float2 := 0.5
#         ^^^ constant.numeric.float.rego

float3 := 1.5e10
#         ^^^^^^ constant.numeric.float.rego

float4 := 2.5E-5
#         ^^^^^^ constant.numeric.float.rego

# Booleans
bool1 := true
#        ^^^^ constant.language.boolean.rego

bool2 := false
#        ^^^^^ constant.language.boolean.rego

# Null
nothing := null
#          ^^^^ constant.language.null.rego
