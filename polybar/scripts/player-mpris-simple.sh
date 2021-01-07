#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo " $(playerctl metadata title) - $(playerctl metadata artist)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl metadata title) - $(playerctl metadata artist)"
else
    echo ""
fi
#pgrep -a "polybar" | grep bottom | cut -d" " -f1 | tr -t '\n' ":" | cut -d":" -f1