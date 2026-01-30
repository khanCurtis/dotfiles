# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  rust
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Environment
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"
export PATH=$PATH:/usr/local/go/bin
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.local/share/omarchy/bin:$PATH"

# History
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history

# Eval
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
# fzf key bindings and completion
source <(fzf --zsh)

# Fastfetch
fastfetch

# TMUX helper
new_tmux () {
  session_dir=$(zoxide query --list | fzf)
  session_name=$(basename "$session_dir")

  if tmux has-session -t $session_name 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach -t "$session_name"
    fi
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session INSIDE TMUX: $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  if [ -s "$session_name" ]; then
    notify-send "$notification"
  fi
}

# Aliases
alias ls='exa --icons -F -H --group-directories-first --git'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias vi="nvim"
alias grep='grep --color=auto'
alias cargohammer='cargo clean && cargo build && cargo run'
alias venvhammer='python3 -m venv venv && source ~/venv/bin/activate'
alias tm=new_tmux

eval "$(starship init zsh)"
