#!/bin/bash

# dotfilesの絶対パスを取得
DOTFILES_DIR=$(cd $(dirname $0)/..; pwd)

echo "Linking dotfiles..."

# ホーム直下のリンク
ln -sfv "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sfv "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# .config配下のリンク (ディレクトリごと)
mkdir -p "$HOME/.config"
for dir in nvim wezterm sheldon zsh-abbr; do
    ln -sfnv "$DOTFILES_DIR/.config/$dir" "$HOME/.config/$dir"
done

# 単体ファイル
ln -sfv "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

# VSCode (macOS用)
VSCODE_SETTING_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "$VSCODE_SETTING_DIR" ]; then
    ln -sfv "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_SETTING_DIR/settings.json"
    ln -sfv "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_SETTING_DIR/keybindings.json"
fi

echo "Done!"
