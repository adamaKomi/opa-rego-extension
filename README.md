# Rego Syntax Support

[![VS Code Marketplace](https://img.shields.io/visual-studio-marketplace/v/AdamaKomi.rego-syntax-support?label=VS%20Code%20Marketplace&logo=visual-studio-code)](https://marketplace.visualstudio.com/items?itemName=AdamaKomi.rego-syntax-support)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> 🎨 Syntax highlighting and language support for [Open Policy Agent (OPA)](https://www.openpolicyagent.org/) Rego policy language in Visual Studio Code.

![Rego Syntax Highlighting Demo](resources/demo.png)

## ✨ Features

- **🎨 Syntax Highlighting** - Full syntax coloring for Rego policy files
- **📝 Snippets** - Code snippets for common Rego patterns (RBAC, ABAC, rules, tests)
- **🔧 Language Configuration** - Bracket matching, auto-closing pairs, and code folding
- **🎯 File Association** - Automatic recognition of `.rego` files

### Syntax Highlighting

| Element | Examples |
|---------|----------|
| **Keywords** | `package`, `import`, `if`, `else`, `not`, `with`, `as`, `default`, `some`, `every`, `in`, `contains` |
| **Comments** | `# This is a comment` |
| **Strings** | `"double quoted"`, `` `raw strings` `` |
| **Numbers** | `42`, `3.14`, `1e10` |
| **Booleans** | `true`, `false`, `null` |
| **Operators** | `==`, `!=`, `:=`, `=`, `<`, `>`, `<=`, `>=` |
| **Built-in Functions** | `count`, `contains`, `startswith`, `http.send`, etc. |
| **Special Variables** | `input`, `data` |

### Code Snippets

| Prefix | Description |
|--------|-------------|
| `pkg` | Package declaration |
| `imp` | Import statement |
| `rule` | Basic rule |
| `allow` | Allow rule template |
| `deny` | Deny rule template |
| `default` | Default rule |
| `some` | Some iteration |
| `every` | Every quantification |
| `test` | Test rule |
| `rbac` | RBAC policy template |
| `abac` | ABAC policy template |

## 📦 Installation

### From VS Code Marketplace

1. Open **VS Code**
2. Go to **Extensions** (`Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Search for **"Rego Syntax Support"**
4. Click **Install**

### From VSIX File

```bash
code --install-extension rego-syntax-support-0.1.0.vsix
```

### From Source

```bash
git clone https://github.com/adamaKomi/opa-rego-extension.git
cd opa-rego-extension
npm install
npm run compile
# Press F5 to launch Extension Development Host
```

## 🚀 Usage

Simply open any `.rego` file and enjoy syntax highlighting!

### Example

```rego
package authz

import future.keywords.if
import future.keywords.in

default allow := false

# Allow if user has admin role
allow if {
    some role in input.user.roles
    role == "admin"
}

# Allow if user owns the resource
allow if {
    input.user.id == input.resource.owner
}
```

## ⚙️ Configuration

This extension contributes the following settings:

| Setting | Default | Description |
|---------|---------|-------------|
| `rego.trace.server` | `"off"` | Trace level for debugging |
| `rego.formatting.enabled` | `true` | Enable/disable formatting (future) |

## 🗺️ Roadmap

- [x] **v0.1.0** - Syntax highlighting & snippets
- [ ] **v0.2.0** - Custom theme support
- [ ] **v0.3.0** - Autocompletion for keywords
- [ ] **v0.4.0** - Linting integration (`opa check`)
- [ ] **v1.0.0** - Full Language Server Protocol support

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide](docs/CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Open Policy Agent](https://www.openpolicyagent.org/) for the amazing Rego language
- [VS Code](https://code.visualstudio.com/) for the extensibility platform
- TextMate grammar contributors

---

**Enjoy coding with Rego! 🎉**
