#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### CUSTOM BASH PROMPT - CBP

if [ -f '/usr/share/git/git-prompt.sh' ]; then . '/usr/share/git/git-prompt.sh'; fi

get_git_branch() {
	# truncate the spaces from __git_ps1's output
	local GIT_PS1=$(__git_ps1 "%s")
	if [ $(__git_ps1) ]; then
		echo -e "(\e[01;32m$(echo $GIT_PS1)\e[0m)"
	else
		echo ""
	fi
}

get_python_env() {
	if test -n "$VIRTUAL_ENV"; then
		#  if PIPENV_ACTIVE is set, we are in pipenv
		if test -n "$PIPENV_ACTIVE"; then
			local PROJECT_DIR="$(pipenv --where)"
			local PYTHON_VIRTUALENV="$(basename $PROJECT_DIR)"
		else
			local PYTHON_VIRTUALENV="$(basename $VIRTUAL_ENV)"
		fi
	else
		unset PYTHON_VIRTUALENV
	fi

	if [ $PYTHON_VIRTUALENV ]; then
		echo -e "(\e[1;36m$(echo $PYTHON_VIRTUALENV)\e[0m)"
	else
		unset PYTHON_VIRTUALENV
		echo ""
	fi
}

function set_bash_prompt() {
	PS1=''

	# Show python env
	local PYTHON_ENV=$(get_python_env)
	if [ -n "$PYTHON_ENV" ]; then
		PS1="${PYTHON_ENV}\n"
	fi

	# Default prompt
	PS1="${PS1}\e[01;31m\u\e[0m at \e[01;33m\h\e[0m in \e[01;34m\w\e[0m"

	# Show git branch
	local GIT_BRANCH=$(get_git_branch)
	if [ -n "$GIT_BRANCH" ]; then
		PS1="${PS1} ${GIT_BRANCH}"
	fi

	# Add a new line and $ sign at the end
	PS1="${PS1}\n$ "
}

PROMPT_COMMAND=set_bash_prompt

# If environment file exists (this includes additional environent details that is specific
# to each workspace or project that I am working on)
if [ -n $TMUX ]; then
	if [ -f .tmux-env ]; then
		source .tmux-env
	fi
	if [ -f .venv/bin/activate ]; then
		source .venv/bin/activate
		tmux set-environment VIRTUAL_ENV "$VIRTUAL_ENV"
	fi
	if [ $NODE_SOURCE ] || [ -f package.json ] || [ -d node_modules ] || [ -f frontend/package.json ]; then
		source $XDG_CONFIG_HOME/scripts/node-setup
	fi
fi


# If VIRTUAL_ENV is set

### END CBP


[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

# vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc


#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Git completion setup for aliases
if [ -f '/usr/share/bash-completion/completions/git' ]; then . '/usr/share/bash-completion/completions/git'; fi

# Bash
source ~/.bash_aliases

# Eval github cli completion only if gh is installed, and the command to eval is eval "$(gh completion -s bash)"
if [ -f '/usr/bin/gh' ]; then eval "$(gh completion -s bash)"; fi

# Auto "cd" when enter just a path
shopt -s autocd

# If a command is typed and it is available as a package
# that package will be recommended
if [ -f '/usr/share/doc/pkgfile/command-not-found.bash' ]; then . '/usr/share/doc/pkgfile/command-not-found.bash'; fi

# Prevent overwrite of files refer [ArchWiki](https://wiki.archlinux.org/title/Bash#Prevent_overwrite_of_files)
set -o noclobber

## Environment variables
export EDITOR="vim"
export TERMINAL="alacritty"

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Zsh like autocomplete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind 'set completion-ignore-case on'

# tmux completion
if [ -f '/usr/share/bash-completion/completions/tmux' ]; then . '/usr/share/bash-completion/completions/tmux'; fi
