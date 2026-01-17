import * as vscode from 'vscode';

/**
 * Extension activation point.
 * Called when the extension is first activated (e.g., when a .rego file is opened).
 */
export function activate(context: vscode.ExtensionContext): void {
  console.log('Rego Syntax Colorizer extension is now active!');

  // Register the show version command
  const showVersionCommand = vscode.commands.registerCommand('rego.showVersion', () => {
    const extension = vscode.extensions.getExtension('opa-rego-extension.rego-syntax-colorizer');
    const version = (extension?.packageJSON as { version?: string })?.version ?? 'unknown';
    void vscode.window.showInformationMessage(`Rego Syntax Colorizer v${version}`);
  });

  context.subscriptions.push(showVersionCommand);

  // Log activation info
  const config = vscode.workspace.getConfiguration('rego');
  const traceLevel = config.get<string>('trace.server', 'off');
  
  if (traceLevel !== 'off') {
    console.log(`Rego extension trace level: ${traceLevel}`);
  }
}

/**
 * Extension deactivation point.
 * Called when the extension is deactivated.
 */
export function deactivate(): void {
  console.log('Rego Syntax Colorizer extension is now deactivated.');
}
