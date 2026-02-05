# 🌌 Yuya's Dotfiles

macOS 向けの開発環境設定（WezTerm + Zsh + Neovim + VSCode）を管理するリポジトリです。
`Makefile` を使用して、シンボリックリンクによる一括セットアップを自動化しています。

## 🛠 Core Stack

| Category | Tool | Description |
| :--- | :--- | :--- |
| **Terminal** | [WezTerm](https://wezfurlong.org/wezterm/) | Luaによる高度なカスタマイズ |
| **Shell** | [Zsh](https://www.zsh.org/) | Sheldonによる高速プラグイン管理 |
| **Editor** | [Neovim](https://neovim.io/) | Lazy.nvimによるモダンなIDE化 |
| **Prompt** | [Starship](https://starship.rs/) | 爆速・軽量なクロスシェルプロンプト |
| **CLI tools** | `eza`, `bat`, `zoxide`, `fd`, `rg` | Rust製の高速な代替コマンド群 |

## 📂 Structure

```text
~/dotfiles/
├── .config/            # 各種ツールの設定ファイル (WezTerm, nvim, etc.)
├── vscode/             # VSCode の設定 (settings.json, keybindings.json)
├── bin/                # セットアップ用シェルスクリプト
├── .zshrc              # Zsh メイン設定ファイル
├── .gitconfig          # Git グローバル設定
├── Makefile            # セットアップ実行用
└── README.md           # このファイル
```


## 🚀 Getting Started

1. Prerequisites (Homebrew)
まず、必要なツールをインストールします。

```Bash
brew install wezterm neovim sheldon starship eza bat fd ripgrep zoxide zsh-abbr
```

2. Clone & Setup
リポジトリをクローンし、make setup を実行してシンボリックリンクを展開します。

```Bash
git clone https://github.com/yuyaamano/dotfiles.git ~/dotfiles
cd ~/dotfiles

# シンボリックリンクを自動生成
make setup
```

3. Reflect Settings
設定を反映させるために、シェルを再起動するか以下を実行してください。

```Bash
source ~/.zshrc
```

## ⌨️ Custom Commands (zsh-abbr)
よく使う略語（Abbreviation）の一部：

- g → git
- v / vim → nvim
- ls → eza (icons & git status enabled)
- cd → z (zoxide)
- wtr → Git Worktree を fzf で選択して移動

## 📝 Maintenance
設定を更新した後は、`~/dotfiles` ディレクトリで変更をコミットして管理してください。

```Bash
cd ~/dotfiles
git add .
git commit -m "feat: update neovim config"
```
