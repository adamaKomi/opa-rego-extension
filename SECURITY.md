# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in this extension, please report it by:

1. **DO NOT** open a public issue
2. Email the maintainers directly (if available)
3. Or use GitHub's private vulnerability reporting feature

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial Assessment**: Within 7 days
- **Fix Release**: Depends on severity
  - Critical: 24-48 hours
  - High: 1 week
  - Medium: 2 weeks
  - Low: Next release

## Security Best Practices

This extension:

- Does not execute arbitrary code
- Does not make network requests
- Does not access file system beyond VS Code APIs
- Only provides syntax highlighting (read-only operation)
- Has no external dependencies at runtime

## Scope

This security policy applies to:

- The published VS Code extension
- The source code in this repository
- Associated build and deployment scripts
