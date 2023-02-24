#
# ~/.bashrc
#

# If not running interactively, don't do anything

### CUSTOM BASH PROMPT - CBP

source /usr/share/git/git-prompt.sh

git_parse() {
	if [ $(__git_ps1) ]
	then
		echo -e "on\e[01;32m$(__git_ps1)\e[0m"
	else
		echo ""
	fi
}

PS1='\e[01;31m\u\e[0m at \e[01;33m\h\e[0m in \e[01;34m\w\e[0m `git_parse` \n$ '

### END CBP



[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

# vi mode
set -o vi

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################


[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

source ~/.bash_aliases
source ~/.bash_profile

# GitHub cli completion
eval "$(gh completion -s bash)"

# Auto "cd" when enter just a path
shopt -s autocd

# If a command is typed and it is available as a package
# that package will be recommended
source /usr/share/doc/pkgfile/command-not-found.bash

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
