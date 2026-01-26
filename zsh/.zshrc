setopt globdots 
setopt interactive_comments 

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY        
setopt SHARE_HISTORY         
setopt HIST_IGNORE_DUPS      
setopt HIST_REDUCE_BLANKS    

setopt AUTO_CD
alias ..='cd ..'

alias ls='eza'
alias ll='eza -lh'
alias la='eza -A'

autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33

bindkey "^a" beginning-of-line
bindkey "^N" history-search-forward
bindkey "^P" history-search-backward

PROMPT=$'%F{yellow}%B%n@%m%F{yelow}%b %B%F{yellow}%~%F{reset}%b \n%B%F{yellow}λ%b%F{reset} '

export EDITOR=nvim

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"
