export HISTSIZE=10000
export XDG_CONFIG_HOME=$HOME/.config
export MONITOR_1=$(xrandr --query | grep " connected " | grep primary | awk -F" " '{ print $1 }')
export MONITOR_2=$(xrandr --query | grep " connected " | grep -v primary | awk -F" " '{ print $1 }' | head -n 1)
export NET_INTERFACE=$(nmcli device  | grep " connected" | awk -F" " '{ print $1 }' | head -n 1)
export EDITOR="vim"
export TERMINAL="alacritty"
