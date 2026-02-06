# --- 1. Homebrewのパス (最優先) ---
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- 2. Zsh 補完システムの初期化 ---
# これを sheldon source より前に書くのがポイントです
autoload -Uz compinit
compinit -d ~/.zshdump  # キャッシュファイルの場所を指定

# --- 3. Sheldon によるプラグイン読み込み ---
eval "$(sheldon source)"

# --- 4. Starship 初期化 ---
eval "$(starship init zsh)"

# --- zsh-abbr ---
# エイリアス管理を zsh-abbr に移行している場合
if [[ -f ~/.config/zsh-abbr/user-abbreviations ]]; then
  # sheldon経由で読み込まれる設定になっているはずですが、
  # 直呼び出しが必要な場合はここに記述します
fi

# エイリアスの設定
alias g='git'
alias v='nvim'
alias vim='nvim'
alias vi='nvim'

# eza (lsの代わり)
if type eza > /dev/null 2>&1; then
  alias ls='eza --icons --git'
  alias ll='eza -al --icons --git --header'
  alias lt='eza -T -L 3 --icons'
fi

# bat (catの代わり)
if type bat > /dev/null 2>&1; then
  alias cat='bat --paging=never'
fi

# zoxide (cdの代わり)
eval "$(zoxide init zsh)"
alias cd='z'

# --- Starship (Prompt) ---
eval "$(starship init zsh)"
