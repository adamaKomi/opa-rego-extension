# Built-in Functions Test
# This file tests all major OPA built-in function categories

package test.builtins

import future.keywords.if
import future.keywords.in

# Aggregation functions
total := sum([1, 2, 3, 4, 5])
maximum := max([10, 20, 5])
minimum := min([10, 20, 5])
length := count(input.items)
multiplied := product([2, 3, 4])

# String functions
lower_case := lower("HELLO")
upper_case := upper("hello")
joined := concat("-", ["a", "b", "c"])
has_prefix := startswith("hello world", "hello")
has_suffix := endswith("hello world", "world")
contains_str := contains("hello", "ell")
replaced := replace("hello", "l", "L")
parts := split("a,b,c", ",")
formatted := sprintf("User: %s, Age: %d", [input.name, input.age])
trimmed := trim_space("  hello  ")
sub := substring("hello", 1, 3)

# Type checking
is_arr := is_array([1, 2, 3])
is_obj := is_object({"a": 1})
is_str := is_string("hello")
is_num := is_number(42)
is_bool := is_boolean(true)
is_set_val := is_set({1, 2, 3})
is_null_val := is_null(null)
type_of := type_name(input.value)

# Number functions
absolute := abs(-5)
ceiling := ceil(3.2)
floored := floor(3.8)
rounded := round(3.5)
range_vals := numbers.range(1, 10)

# Time functions
now := time.now_ns()
parsed := time.parse_rfc3339_ns("2023-01-01T00:00:00Z")
date_parts := time.date(now)
clock_parts := time.clock(now)
day_of_week := time.weekday(now)

# Encoding functions
b64_encoded := base64.encode("hello")
b64_decoded := base64.decode("aGVsbG8=")
url_encoded := urlquery.encode("hello world")
url_decoded := urlquery.decode("hello%20world")
json_str := json.marshal({"key": "value"})
json_obj := json.unmarshal("{\"key\": \"value\"}")

# Crypto functions
sha256_hash := crypto.sha256("data")
md5_hash := crypto.md5("data")

# Network functions
in_cidr := net.cidr_contains("10.0.0.0/8", "10.1.2.3")
cidrs_overlap := net.cidr_intersects("10.0.0.0/8", "10.1.0.0/16")

# Set operations
union_set := union({1, 2}, {2, 3})
intersect_set := intersection({1, 2, 3}, {2, 3, 4})

# Object functions
obj_val := object.get(input, "key", "default")
obj_removed := object.remove({"a": 1, "b": 2}, {"b"})
obj_merged := object.union({"a": 1}, {"b": 2})

# Array functions
arr_concat := array.concat([1, 2], [3, 4])
arr_slice := array.slice([1, 2, 3, 4, 5], 1, 3)

# Sorting
sorted_arr := sort([3, 1, 2])

# Graph functions
reachable := graph.reachable({"a": ["b"], "b": ["c"]}, {"a"})

# Glob matching
glob_matched := glob.match("*.rego", [], "policy.rego")

# Semantic versioning
valid_semver := semver.is_valid("1.2.3")
semver_cmp := semver.compare("1.2.0", "1.3.0")

# Units parsing
bytes_val := units.parse_bytes("1Ki")

# UUID generation
new_uuid := uuid.rfc4122("")

# Debugging
debug if {
    print("Debug value:", input.value)
    trace("Tracing execution")
}
