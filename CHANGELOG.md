# Changelog

All notable changes to the "Rego Syntax Support" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Custom theme support
- Autocompletion for keywords and built-in functions
- Integration with `opa check` for linting
- Go to definition support
- Hover documentation

## [0.1.0] - 2026-01-17

### Added
- 🎨 **Syntax Highlighting** for Rego policy files
  - Keywords: `package`, `import`, `if`, `else`, `not`, `with`, `as`, `default`, `some`, `every`, `in`, `contains`
  - Comments: line comments with `#`
  - Strings: double-quoted and raw strings
  - Numbers: integers and floats
  - Operators: comparison, assignment, arithmetic, logical
  - Built-in functions: 50+ OPA built-in functions
  - Special variables: `input`, `data`
  
- 📝 **Code Snippets** for common patterns
  - Package and import declarations
  - Rule templates (allow, deny, default)
  - Iteration patterns (some, every)
  - Comprehensions (set, array, object)
  - Policy templates (RBAC, ABAC)
  - Test templates
  
- 🔧 **Language Configuration**
  - Bracket matching and auto-closing
  - Comment toggling with `#`
  - Code folding support
  - Word pattern recognition
  - Indentation rules

- 📁 **File Association**
  - Automatic recognition of `.rego` files

### Technical
- TypeScript-based extension architecture
- TextMate grammar for syntax highlighting
- ESLint and Prettier configuration
- Test infrastructure setup

---

[Unreleased]: https://github.com/adamaKomi/opa-rego-extension/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/adamaKomi/opa-rego-extension/releases/tag/v0.1.0
