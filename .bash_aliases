alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias sl='ls'
alias l="ls"
alias lf='ls -lAF'
alias la='ls -a'

alias codedir='cd $codedir'

alias echocolors="echo -e '\e[40m   \e[41m   \e[42m   \e[43m   \e[44m   \e[45m   \e[46m   \e[47m   \n\e[100m   \e[101m   \e[102m   \e[103m   \e[104m   \e[105m   \e[106m   \e[107m   \e[0m'"

alias grep="grep --color=auto"

alias gdb-noc="gdb --silent"

alias v="vim"
alias vi="vim"
alias vmi="vim"

alias cd..="cd .."

### Git Aliases ###
alias gst="git status"
alias add="git add"
alias push="git push --verify --verbose --progress"
alias pull="git pull --verify --verbose"
alias fetch="git fetch --verify --verbose"

### Setup nvm
alias usenvm='export NVM_DIR="$HOME/.config/nvm";[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";'
