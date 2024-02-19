#
# ~/.bash_profile
#
#
source "$HOME/.profile"

# if running bash
# if [ -n "$BASH_VERSION" ]; then
# 	# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

# fi
