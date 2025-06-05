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


# setopt autocd              # change directory just by typing its name
# #setopt correct            # auto correct mistakes
# setopt interactivecomments # allow comments in interactive mode
# setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
# setopt nonomatch           # hide error message if there is no match for the pattern
# setopt notify              # report the status of background jobs immediately
# setopt numericglobsort     # sort filenames numerically when it makes sense
# setopt promptsubst         # enable command substitution in prompt

# WORDCHARS=${WORDCHARS//\/}

# PROMPT_EOL_MARK=""

# bindkey -e                                        # emacs key bindings
# bindkey ' ' magic-space                           # do history expansion on space
# bindkey '^U' backward-kill-line                   # ctrl + U
# bindkey '^[[3;5~' kill-word                       # ctrl + Supr
# bindkey '^[[3~' delete-char                       # delete
# bindkey '^[[1;5C' forward-word                    # ctrl + ->
# bindkey '^[[1;5D' backward-word                   # ctrl + <-
# bindkey '^[[5~' beginning-of-buffer-or-history    # page up
# bindkey '^[[6~' end-of-buffer-or-history          # page down
# bindkey '^[[H' beginning-of-line                  # home
# bindkey '^[[F' end-of-line                        # end
# bindkey '^[[Z' undo                               # shift + tab undo last action

# autoload -Uz compinit
# compinit -d ~/.cache/zcompdump
# zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' rehash true
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# HISTFILE=~/.zsh_history
# HISTSIZE=1000
# SAVEHIST=2000
# setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
# setopt hist_ignore_dups       # ignore duplicated commands history list
# setopt hist_ignore_space      # ignore commands that start with space
# setopt hist_verify            # show command with history expansion to user before running it
# #setopt share_history         # share command history data

# alias history="history 0"

# TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# case "$TERM" in
#     xterm-color|*-256color) color_prompt=yes;;
# esac

# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#         color_prompt=yes
#     else
#         color_prompt=
#     fi
# fi

# configure_prompt() {
#     prompt_symbol=@
#     case "$PROMPT_ALTERNATIVE" in
#         twoline)
#             PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)}) %B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)} \n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
#             ;;
#         oneline)
#             PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b%F{reset}%(#.#.$) '
#             RPROMPT=
#             ;;
#         backtrack)
#             PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b%F{reset}%(#.#.$) '
#             RPROMPT=
#             ;;
#     esac
#     unset prompt_symbol
# }

# PROMPT_ALTERNATIVE=twoline
# NEWLINE_BEFORE_PROMPT=yes

# if [ "$color_prompt" = yes ]; then
#     VIRTUAL_ENV_DISABLE_PROMPT=1

#     configure_prompt

#     if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#         . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#         ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
#         ZSH_HIGHLIGHT_STYLES[default]=none
#         ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
#         ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
#         ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
#         ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
#         ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
#         ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
#         ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
#         ZSH_HIGHLIGHT_STYLES[path]=bold
#         ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
#         ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
#         ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
#         ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
#         ZSH_HIGHLIGHT_STYLES[command-substitution]=none
#         ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
#         ZSH_HIGHLIGHT_STYLES[process-substitution]=none
#         ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
#         ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
#         ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
#         ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
#         ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
#         ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
#         ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
#         ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
#         ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
#         ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
#         ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
#         ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
#         ZSH_HIGHLIGHT_STYLES[assign]=none
#         ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
#         ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
#         ZSH_HIGHLIGHT_STYLES[named-fd]=none
#         ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
#         ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
#         ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
#         ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
#         ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
#         ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
#         ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
#         ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
#         ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
#     fi
# else
#     PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
# fi
# unset color_prompt force_color_prompt

# toggle_oneline_prompt(){
#     if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
#         PROMPT_ALTERNATIVE=twoline
#     else
#         PROMPT_ALTERNATIVE=oneline
#     fi
#     configure_prompt
#     zle reset-prompt
# }
# zle -N toggle_oneline_prompt
# bindkey ^P toggle_oneline_prompt

# case "$TERM" in
# xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
#     TERM_TITLE=$'\e]0;${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%n@%m: %~\a'
#     ;;
# *)
#     ;;
# esac

# precmd() {
#     print -Pnr -- "$TERM_TITLE"
#     if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
#         if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
#             _NEW_LINE_BEFORE_PROMPT=1
#         else
#             print ""
#         fi
#     fi
# }

# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     export LS_COLORS="$LS_COLORS:ow=30;44:"

#     alias ls='ls --color=auto'
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
#     alias diff='diff --color=auto'
#     alias ip='ip --color=auto'

#     export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
#     export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
#     export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
#     export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
#     export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
#     export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
#     export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#     zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#     zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# fi

# alias ll='ls -l'
# alias la='ls -A'
# alias l='ls -CF'

# if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#     . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#     ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
# fi

# if [ -f /etc/zsh_command_not_found ]; then
#     . /etc/zsh_command_not_found
# fi
# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# # pnpm
# export PNPM_HOME="/home/nick/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac

# # bun
# [ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
