# Rego TextMate Grammar Documentation

This document describes the TextMate grammar implementation for Rego syntax highlighting.

## Scope Naming Convention

We follow the [TextMate scope naming conventions](https://macromates.com/manual/en/language_grammars#naming_conventions) to ensure compatibility with VS Code themes.

## Scope Mappings

### Keywords

| Rego Element | Scope | Theme Color (typical) |
|--------------|-------|----------------------|
| `package`, `import` | `keyword.other.rego` | Purple |
| `if`, `else`, `not`, `with`, `as`, `default` | `keyword.control.rego` | Purple |
| `some`, `every`, `in`, `contains` | `keyword.control.rego` | Purple |

### Literals

| Rego Element | Scope | Theme Color (typical) |
|--------------|-------|----------------------|
| `true`, `false` | `constant.language.boolean.rego` | Blue |
| `null` | `constant.language.null.rego` | Blue |
| `42`, `3.14` | `constant.numeric.rego` | Light Green |
| `"string"` | `string.quoted.double.rego` | Orange |
| `` `raw` `` | `string.quoted.raw.rego` | Orange |

### Operators

| Rego Element | Scope |
|--------------|-------|
| `:=`, `=` | `keyword.operator.assignment.rego` |
| `==`, `!=`, `<`, `>`, `<=`, `>=` | `keyword.operator.comparison.rego` |
| `+`, `-`, `*`, `/`, `%` | `keyword.operator.arithmetic.rego` |
| `&`, `\|` | `keyword.operator.logical.rego` |

### Built-in Functions

All built-in functions use `support.function.*.rego` scopes:

- `support.function.aggregate.rego` - count, sum, max, min, etc.
- `support.function.string.rego` - concat, contains, split, etc.
- `support.function.regex.rego` - regex.match, etc.
- `support.function.type.rego` - is_array, is_string, etc.
- `support.function.time.rego` - time.now_ns, etc.
- `support.function.crypto.rego` - crypto.sha256, etc.
- `support.function.http.rego` - http.send
- `support.function.net.rego` - net.cidr_contains, etc.

### Special Variables

| Variable | Scope |
|----------|-------|
| `input` | `variable.language.input.rego` |
| `data` | `variable.language.data.rego` |

### Entities

| Element | Scope |
|---------|-------|
| Package name | `entity.name.namespace.rego` |
| Rule name | `entity.name.function.rule.rego` |
| Import path | `entity.name.import.rego` |

## Pattern Priority

Patterns are applied in order. Our priority:

1. **Comments** - Highest priority, prevents other patterns inside comments
2. **Strings** - Prevents keyword matching inside strings
3. **Package/Import declarations** - Special multi-token patterns
4. **Rule definitions** - Identify rule names
5. **Keywords** - Language keywords
6. **Constants** - Booleans, null
7. **Operators** - Various operators
8. **Built-in functions** - OPA built-ins
9. **Variables** - input, data
10. **Numbers** - Numeric literals
11. **Punctuation** - Brackets, commas, etc.

## Testing the Grammar

Use VS Code's built-in token inspector:

1. Open a `.rego` file
2. Run command: `Developer: Inspect Editor Tokens and Scopes`
3. Click on any token to see its scope

## Adding New Patterns

When adding new patterns:

1. Determine the correct scope name from TextMate conventions
2. Add the pattern to the appropriate section in `repository`
3. Include the pattern in the main `patterns` array if top-level
4. Test with the token inspector
5. Verify with multiple themes (Dark+, Light+, etc.)

## References

- [Rego Language Reference](https://www.openpolicyagent.org/docs/latest/policy-language/)
- [OPA Built-in Functions](https://www.openpolicyagent.org/docs/latest/policy-reference/#built-in-functions)
- [TextMate Grammar Documentation](https://macromates.com/manual/en/language_grammars)
- [VS Code Syntax Highlighting Guide](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide)
