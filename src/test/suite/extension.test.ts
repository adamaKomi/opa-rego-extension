import * as assert from 'assert';
import * as vscode from 'vscode';

suite('Extension Test Suite', () => {
  vscode.window.showInformationMessage('Start all tests.');

  test('Extension should be present', () => {
    assert.ok(vscode.extensions.getExtension('opa-rego-extension.rego-syntax-colorizer'));
  });

  test('Rego language should be registered', async () => {
    const languages = await vscode.languages.getLanguages();
    assert.ok(languages.includes('rego'), 'Rego language should be registered');
  });

  test('Show version command should be registered', async () => {
    const commands = await vscode.commands.getCommands(true);
    assert.ok(commands.includes('rego.showVersion'), 'Show version command should be registered');
  });
});
