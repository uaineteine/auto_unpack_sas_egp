const vscode = require('vscode');
const cp = require('child_process');
const path = require('path');

function activate(context) {
    let disposable = vscode.commands.registerCommand('extension.run_extractegp_ps', function (fileUri) {
        // The path of the PowerShell script bundled with the extension
        let scriptPath = path.join(context.extensionPath, 'execute.ps1');

        // The path of the file that was right-clicked in VS Code
        let filePath = fileUri.fsPath;

        // Run the PowerShell script with the file path as an argument
        cp.exec(`powershell -File "${scriptPath}" "${filePath}"`, (error, stdout, stderr) => {
            if (error) {
                vscode.window.showErrorMessage(`Error: ${error.message}`);
                return;
            }

            if (stderr) {
                vscode.window.showErrorMessage(`Error: ${stderr}`);
                return;
            }

            vscode.window.showInformationMessage(stdout);
        });
    });

    context.subscriptions.push(disposable);
}

exports.activate = activate;
