## System
# General aliases
alias sx=startx
alias ls='exa --icons --color=always' 
alias la='ls -a'
alias ll='ls -l'
alias lt='ls -la'
alias tree='exa -T'
alias vim=nvim
alias ka=killall
alias reboot='sudo reboot now'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color'
alias hist=history
alias path='echo -e ${PATH//:/\\n}'
alias pingarch="ping -c 5 archlinux.org"
alias pingnet="ping -c 5  8.8.8.8"
alias ip='ip --color'
# Apps
alias open=pcmanfm

# record screen
alias record='ffmpeg -framerate 30 -f x11grab -i $DISPLAY -f alsa -ac 2 -i hw:0 $1'
alias play='ffplay'

# Python aliases
alias py=python
alias venv='python -m venv .venv'
alias vact='source .venv/bin/activate'
alias dact=deactivate


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


## Pacman
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacs='sudo pacman -Ss'
alias paci='sudo pacman -Si'
alias pacr='sudo pacman -Rscn'
alias pacq='sudo pacman -Q'    # list all packages
alias paco='sudo pacman -Qdt'  # Orphans
alias pacor='sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
alias pacc='sudo pacman -Scc'  # Clear cache
alias arch-fix-key='sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'


# Git
# Git bare: manage dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias g=git
alias gs='g status'
alias gst='g status'
alias gss='g status -s'
alias ga='g add'
alias gad='g add'
alias gaa='g add -A'
alias gam='g add -am'
alias gc='g commit'
alias gcm='g commit -m'
alias gb='g branch'
alias gbr='g branch'
alias gbl='gb -a'
alias gp='g push'
alias gpu='g push'
alias gpo='g push -u origin main'
alias gu='g pull'
alias gpl='g pull'
alias guo='g pull origin main'
alias gw='g switch'
alias gsw='g switch'
alias gl='g log'
alias glg='g log'
alias glo='g log'
alias gcl='g clone'


