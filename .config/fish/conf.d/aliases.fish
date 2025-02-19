## --------------
##   Aliases
# ---------------
# General aliases
alias sx startx
alias ls 'exa --icons --color=always'
alias la 'ls -a'
alias ll 'ls -lha'
alias lt 'ls -lhH -t modified'
alias .. 'cd ..'
alias ... 'cd ../..'
alias cd.. 'cd ..'
alias cd... 'cd ../..'
alias cp 'cp -r'
alias rm 'rm -r'
alias rmf 'rm -rf'
alias cls 'clear'
alias tree 'exa -T'
alias ka killall
alias reboot 'sudo reboot now'
alias grep 'grep --color'
alias hist history
alias pingarch "ping -c 5 archlinux.org"
alias pingnet "ping -c 5  8.8.8.8"
alias ip 'ip --color'
alias bat 'bat -pn --theme="OneHalfDark"'
alias lg lazygit
alias poe poetry


# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

alias open pcmanfm
alias record 'ffmpeg -framerate 60 -f x11grab -i $DISPLAY -f  pulse -i default $1'
alias play 'ffplay'
alias show 'sxiv'

# Python aliases
alias py python
alias venv 'python -m venv .venv'
alias vact 'source .venv/bin/activate'
alias dact deactivate

# Django aliases
abbr djapp 'python manage.py startapp'
abbr djrun 'python manage.py runserver'
abbr djmkm 'python manage.py makemigrations'
abbr djmig 'python manage.py migrate'
abbr djcsu 'python manage.py createsuperuser --username admin --email ad@min.com'
abbr djshl 'python manage.py shell'


# Reflector
alias mirror 'sudo reflector --fastest 30 --latest 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist --download-timeout 60'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrorl 'sudo reflector --country Iran,Turky --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorg 'sudo reflector --country  Germany,Denmark,Netherland,Sweeden --sort rate --save /etc/pacman.d/mirrorlist'


## Pacman
abbr pac 'sudo pacman -S'
abbr pacu 'sudo pacman -Syu'
abbr pacs 'sudo pacman -Ss'
abbr pacr 'sudo pacman -Rscn'
abbr pacq 'sudo pacman -Q'    # list all packages
abbr paci 'sudo pacman -Qi'
abbr paco 'sudo pacman -Qdt'  # Orphans
abbr pacor 'sudo pacman -Rns $(pacman -Qtdq)'  # remove orphans
abbr pacc 'sudo pacman -Scc'  # Clear cache
abbr arch-fix-key 'sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys'


# Git
# Git bare: manage dotfiles
alias dots '/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
abbr gst 'git status'
abbr gss 'git status -s'
abbr gaa 'git add -A'
abbr gam 'git commit -am'
abbr gcm 'git commit -m'
abbr gbc 'git branch'
abbr gbl 'git branch --all'
abbr gpu 'git push'
abbr gpm 'git push -u origin main'
abbr gpd 'git push -u origin dev'
abbr gpl 'git pull'
abbr glo 'git pull origin main'
abbr gsw 'git switch'
abbr gsm 'git switch main'
abbr gsd 'git switch dev'
abbr glg 'git log'
abbr gco 'git clone'
