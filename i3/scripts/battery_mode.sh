#!/bin/sh
TEMPS="/home/psyhich/.config/i3/temps"

# kill -s kill "$(cat $TEMPS/xwinwrap_pid)" > /dev/null 2>&1 
kill -s kill "$(cat $TEMPS/picom_pid)" > /dev/null 2>&1

feh --bg-fill ~/Pictures/Wallpapers/current_wallpaper &
cat "$!" > "$TEMPS/feh_pid"

