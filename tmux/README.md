# TMUX Configuration

This guide will walk you through setting up and using the TMUX configuration from the provided .tmux.conf file, including enabling mouse support, managing panes and windows, custom key bindings, and using plugins like Dracula and Catppuccin themes. Additionally, it explains how to install and use the TMUX Plugin Manager (TPM) for extended functionality.

Prerequisites

- TMUX Installation:
Make sure TMUX is installed on your system. If not, you can install it using the following commands:
	•	Ubuntu/Debian:

``` 
sudo apt-get update
sudo apt-get install tmux

or 

brew install tmux
```

## Key Bindings & Settings

1. Prefix Keys

	•	Ctrl+A: Main prefix key (customized from default Ctrl+B)
	•	Ctrl+B: Secondary prefix key (still enabled)

After pressing a prefix key, you can use the following shortcuts.

2. Window & Pane Management

	•	Horizontal Split: `Prefix + v` (splits the current pane horizontally)
	•	Vertical Split: `Prefix + h` (splits the current pane vertically)
	•	Renumber Windows: Windows are automatically renumbered when closed.

3. Scrolling History

	•	TMUX stores up to 50,000 lines of scrollback history.

4. Mouse Support

	•	Mouse interaction is enabled for pane resizing, scrolling, and window switching.

5. Updating and Reloading TMUX Configuration
	•	Reload TMUX Configuration:
If you make changes to the .tmux.conf file, you can reload the configuration within TMUX by running:
`tmux source-file ~/.tmux.conf`

## Update Plugins:
Press Prefix + U to update all plugins.
	•	Uninstall Plugins:
To uninstall a plugin, remove the corresponding line from .tmux.conf and press Prefix + alt + u to remove it.

## Troubleshooting
1.	Plugins Not Working:
If a plugin isn’t loading, ensure TPM is installed correctly and run Prefix + I again to install the missing plugins.
2.	Clipboard Not Working:
Ensure that xclip is installed and uncomment the clipboard-related lines in .tmux.conf.
