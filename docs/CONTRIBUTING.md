# Contributing to Rego Syntax Colorizer

First off, thank you for considering contributing to Rego Syntax Colorizer! 🎉

## Code of Conduct

By participating in this project, you are expected to uphold our Code of Conduct: be respectful, inclusive, and constructive.

## How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check the existing issues. When creating a bug report, include:

- **Clear title** describing the issue
- **Steps to reproduce** the behavior
- **Expected behavior** vs actual behavior
- **Screenshots** if applicable
- **Environment details**: VS Code version, OS, extension version

### 💡 Suggesting Features

Feature suggestions are welcome! Please include:

- **Use case**: Why is this feature needed?
- **Proposed solution**: How should it work?
- **Alternatives considered**: Other approaches you've thought of

### 🔧 Pull Requests

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create a branch** for your feature/fix: `git checkout -b feature/my-feature`
4. **Make your changes** following our coding standards
5. **Test** your changes thoroughly
6. **Commit** with a clear message: `git commit -m "feat: add amazing feature"`
7. **Push** to your fork: `git push origin feature/my-feature`
8. **Open a Pull Request** against the `main` branch

## Development Setup

### Prerequisites

- Node.js 18+
- npm 9+
- VS Code 1.85+

### Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/rego-syntax-colorizer.git
cd rego-syntax-colorizer

# Install dependencies
npm install

# Compile TypeScript
npm run compile

# Run in development mode
# Press F5 in VS Code to launch Extension Development Host
```

### Project Structure

```
├── src/                    # TypeScript source code
│   ├── extension.ts        # Extension entry point
│   └── test/               # Test files
├── syntaxes/               # TextMate grammar
│   └── rego.tmLanguage.json
├── languages/              # Language configuration
├── snippets/               # Code snippets
└── resources/              # Icons and images
```

### Coding Standards

- **TypeScript**: Strict mode enabled, use proper types
- **Formatting**: Prettier with project configuration
- **Linting**: ESLint with TypeScript rules
- **Commits**: Follow [Conventional Commits](https://www.conventionalcommits.org/)
  - `feat:` new feature
  - `fix:` bug fix
  - `docs:` documentation
  - `style:` formatting
  - `refactor:` code restructuring
  - `test:` adding tests
  - `chore:` maintenance

### Testing

```bash
# Run linting
npm run lint

# Run tests
npm run test

# Run all checks
npm run pretest
```

### Modifying the Grammar

The TextMate grammar is in `syntaxes/rego.tmLanguage.json`. When modifying:

1. Refer to [TextMate Grammar documentation](https://macromates.com/manual/en/language_grammars)
2. Test with various Rego files in `test/fixtures/`
3. Use VS Code's "Developer: Inspect Editor Tokens and Scopes" command

## Release Process

1. Update version in `package.json`
2. Update `CHANGELOG.md`
3. Create a git tag: `git tag v0.x.0`
4. Push with tags: `git push --tags`
5. GitHub Actions will publish to marketplace

## Questions?

Feel free to open an issue with the "question" label!

---

Thank you for contributing! 🚀
