# ---------
# Alisees
# ---------
alias sx=startx
alias ls='exa --icons --color=always' 
alias ll='ls -lh'
alias ..='cd ..'
alias ...='cd ../..'
alias cp='cp -r'
alias rm='rm -r'
alias rmf='rm -rf'
alias tree='exa -T'
alias vim=nvim
alias v='nvim $(fzf)'
alias ka=killall
alias grep='grep --color'
alias hist=history
alias path='echo -e ${PATH//:/\\n}'
alias pingarch="ping -c 5 archlinux.org"
alias pingnet="ping -c 5  8.8.8.8"
alias ip='ip --color'
alias bat='bat -pn --theme="OneHalfDark"'
# apps
alias open=pcmanfm
alias record='ffmpeg -framerate 60 -f x11grab -i $DISPLAY -f  pulse -i default $1'
alias play='ffplay'
alias show='sxiv'
alias reader=zathura
alias edit=leafpad
# Django aliases
alias djapp='python manage.py startapp'
alias djrun='python manage.py runserver'
alias djmkm='python manage.py makemigrations'
alias djmig='python manage.py migrate'
alias djcsu='python manage.py createsuperuser --username admin --email ad@min.com'
# Reflector
alias mirror='sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrorl='sudo reflector --country Iran,Turky --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorg='sudo reflector --country  Germany,Denmark,Netherland,Sweeden --sort rate --save /etc/pacman.d/mirrorlist'
# pacman
alias paco='sudo pacman -Qdt'  # Orphans
alias pacor='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
# other
alias arch-fix-key='sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'


# ---------
# Exports
# ---------
export HOME=~
export EDITOR="nvim"
export BROWSER="chrome"
export TERMINAL="st"
# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
# history
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0" 
# PL
export GOPATH=$XDG_DATA_HOME/go
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
# Color for man page
export MANPAGER="less -R --use-color -Dd+r -Du+b" 
export GROFF_NO_SGR=1 
export LESS="R --use-color -Dd+r -Du+b"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# Extend path
export PATH=$PATH:/home/saeed/.local/bin/scripts
export PATH=$PATH:/home/saeed/.cargo/bin


# -----------
# Options
# set -o  # list all options
# -----------
ZVM_INIT_MODE=sourcing  # version management like git
HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
# ---------
unsetopt BEEP
setopt share_history
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd
setopt vi
# ---------
autoload -U colors && colors	    # Load colors
autoload -U compinit && compinit # defualt auto complete
zmodload -i zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors 'm:{(s.:.)LS_COLORS}'
zstyle ':completion:*' complete-options true
# Third party compeletion.
fpath=(/usr/share/zsh-completions $fpath)


# ---------
# Plugins
# ---------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source <(fzf --zsh) 
eval "$(zoxide init zsh)" 
# enable z command

# ---------------
# VI keybindings
# zle -al  # list all functions to bind
# ---------------
bindkey -v
bindkey jk vi-cmd-mode
# delete
bindkey '^k' kill-line
bindkey '^[d' kill-word 
bindkey '^[h' backward-kill-word
# Move 
bindkey '^[f' forward-word  
bindkey '^[b' backward-word  
# auto comp menu
bindkey '^n' menu-select
bindkey "^p" menu-select
bindkey -M menuselect '^n' menu-complete
bindkey -M menuselect "^p" reverse-menu-complete
# auto suggestion / next and prev sub suggestion.
bindkey '^n' history-substring-search-down
bindkey '^p' history-substring-search-up
bindkey '^B' autosuggest-toggle
# fzf
bindkey -s '^f' 'fzf\n'
bindkey -s '^o' 'v\n'

# ---------
# Prompt
# ---------
# PROMPT='%n@%m:%~$ '
# Load vcs_info
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '%b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'

seg_s='%F{white}[%f'
seg_e='%F{white}]%f'
un='%F{white}%n%f'
hn='%F{white}%m%f'
dir='%F{blue}%1~%f'
cmd_status='%(?.%F{white}$%f.%F{red}$%f) '
git_seg='%F{magenta}${vcs_info_msg_0_}%f'
space=' '

PROMPT='$seg_s$un%F{red}@%f$hn$space$dir$seg_e$cmd_status'
RPROMPT="$git_seg"

