# SYNTAX TEST "source.rego" "Rego Built-in Functions Test"

package test.builtins

# Aggregate functions
agg1 := count(array)
#       ^^^^^ support.function.aggregate.rego

agg2 := sum([1, 2, 3])
#       ^^^ support.function.aggregate.rego

agg3 := max(numbers)
#       ^^^ support.function.aggregate.rego

agg4 := min(numbers)
#       ^^^ support.function.aggregate.rego

agg5 := sort(items)
#       ^^^^ support.function.aggregate.rego

# String functions
str1 := concat("-", parts)
#       ^^^^^^ support.function.string.rego

str2 := contains(haystack, needle)
#       ^^^^^^^^ support.function.string.rego

str3 := startswith(str, prefix)
#       ^^^^^^^^^^ support.function.string.rego

str4 := endswith(str, suffix)
#       ^^^^^^^^ support.function.string.rego

str5 := lower(text)
#       ^^^^^ support.function.string.rego

str6 := upper(text)
#       ^^^^^ support.function.string.rego

str7 := sprintf("%s: %d", [name, count])
#       ^^^^^^^ support.function.string.rego

str8 := split(text, ",")
#       ^^^^^ support.function.string.rego

# Type checking
type1 := is_string(val)
#        ^^^^^^^^^ support.function.type.rego

type2 := is_array(val)
#        ^^^^^^^^ support.function.type.rego

type3 := is_object(val)
#        ^^^^^^^^^ support.function.type.rego

type4 := is_number(val)
#        ^^^^^^^^^ support.function.type.rego

type5 := is_boolean(val)
#        ^^^^^^^^^^ support.function.type.rego

type6 := type_name(val)
#        ^^^^^^^^^ support.function.type.rego

# Number functions
num1 := abs(-5)
#       ^^^ support.function.numbers.rego

num2 := ceil(3.2)
#       ^^^^ support.function.numbers.rego

num3 := floor(3.8)
#       ^^^^^ support.function.numbers.rego

num4 := round(3.5)
#       ^^^^^ support.function.numbers.rego

# Time functions
time1 := time.now_ns()
#        ^^^^^^^^^^^ support.function.time.rego

time2 := time.parse_rfc3339_ns(str)
#        ^^^^^^^^^^^^^^^^^^^^^ support.function.time.rego

# Crypto functions
crypto1 := crypto.sha256(data)
#          ^^^^^^^^^^^^^ support.function.crypto.rego

crypto2 := crypto.md5(data)
#          ^^^^^^^^^^ support.function.crypto.rego

# HTTP
http1 := http.send(request)
#        ^^^^^^^^^ support.function.http.rego

# Network
net1 := net.cidr_contains(cidr, ip)
#       ^^^^^^^^^^^^^^^^^ support.function.net.rego

# Debugging
debug if {
    print("debug message")
#   ^^^^^ support.function.tracing.rego
    trace("trace point")
#   ^^^^^ support.function.tracing.rego
}

# Special variables
check if {
    input.user == "admin"
#   ^^^^^ variable.language.input.rego
    data.policies[_]
#   ^^^^ variable.language.data.rego
}
