# Auto reload zsh-config
autoload -Uz compinit promptinit
compinit
promptinit

setopt globdots # add dotfiles
setopt interactive_comments # allow comments in shell

# Command history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # History to cache
HISTCONTROL=ignoreboth # Consecutive duplicates & commands starting with space are not saved
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Change-directory without cd
setopt AUTO_CD
alias ..='cd ..'

# Alises for ls
alias ll='ls -lh'
alias la='ls -A'

# Auto completion for commands
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33

# Binds
bindkey "^a" beginning-of-line
# Ctrl+J & Ctrl+K for going up and down in prev commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward

# Promt
PROMPT=$'%F{blue}┌──(%F{red}%B%n%F{red}@%F{red}%m%F{blue}%b) %B%F{red}%~%F{reset}%b \n%F{cyan}└─%F%B%(#.%F{red}#.%F{red}$)%b%F{reset} '

# bun
alias b='bun'
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# pnpm
export PNPM_HOME="/home/nick/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
