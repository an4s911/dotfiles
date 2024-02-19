alias ls='ls --color=auto -F'
alias ll='ls -lavsh --ignore=..' # show long listing of all except "..", show human readable file sizes as well
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias sl='ls'
alias l="ls"
alias la='ls -a'

alias codedir='cd $codedir'

alias echocolors="echo -e '\e[40m   \e[41m   \e[42m   \e[43m   \e[44m   \e[45m   \e[46m   \e[47m   \n\e[100m   \e[101m   \e[102m   \e[103m   \e[104m   \e[105m   \e[106m   \e[107m   \e[0m'"

alias grep="grep --color=auto"

alias gdb-noc="gdb --silent"

alias vmi="vim"
alias vi="vim"

alias nv="nvim"
alias nivm="nvim"

alias cd..="cd .."

alias battery-health="awk -v curr='$(cat /sys/class/power_supply/BAT0/energy_full)' -v design='$(cat /sys/class/power_supply/BAT0/energy_full_design)' 'BEGIN { printf \"%.2f%%\n\", (curr/design*100) }'"

### Git Aliases ###
alias gst="git status"
alias add="git add"
alias push="git push --verify --verbose --progress"
alias pull="git pull --verify --verbose"
alias fetch="git fetch --verify --verbose"

# dotfiles
alias dft="/usr/bin/git --work-tree=$HOME --git-dir=$HOME/dotfiles/private"
__git_complete dft __git_main
alias dfst="dft status"
alias dft-commit="dft commit -m \"$(date +'Backup at %d %b %Y %R')\""


### Setup nvm
alias usenvm='export NVM_DIR="$HOME/.config/nvm";[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";'
