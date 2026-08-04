my dev conf.

## Apply tmux + nvim setup on this PC

From this repository root, run:

```bash
chmod +x ./setup-nvim-tmux.sh
./setup-nvim-tmux.sh
```

What it does:

- Symlinks `tmux/.tmux.conf` to `~/.tmux.conf`
- Symlinks `nvim/` to `~/.config/nvim`
- Backs up existing configs to `~/.config/dev-setup-backups/<timestamp>/`
- Installs TPM (`~/.tmux/plugins/tpm`) if missing

After running:

1. Reload tmux: `tmux source-file ~/.tmux.conf`
2. Install tmux plugins in tmux: `prefix + I`
3. Open nvim and run `:PackerSync`
