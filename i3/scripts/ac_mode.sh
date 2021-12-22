#!/bin/sh
TEMPS="/home/psyhich/.config/i3/temps"

# kill -s kill "$(cat $TEMPS/xwinwrap_pid)" > /dev/null 2>&1 
kill -s kill "$(cat $TEMPS/feh_pid)" > /dev/null 2>&1
kill -s kill "$(cat $TEMPS/picom_pid)" > /dev/null 2>&1

sleep 0.5

picom --experimental-backends --backend glx --xrender-sync-fence &
echo "$!" > "$TEMPS/picom_pid"

feh --bg-scale ~/Pictures/Wallpapers/current_wallpaper &
cat "$!" > "$TEMPS/feh_pid"

# xwinwrap -g 1920x1080 -ni -s -nf -b -un -ov -fdt -argb -- mpv --vo=gpu --hwdec=vdpau --mute=yes --no-audio --no-osc --no-osd-bar --quiet --screen=0 --geometry=1920x1080+0+0 -wid WID --loop /home/psyhich/Pictures/AnimatedWallpaper/CurrentWallpaper.mp4 >> /home/psyhich/logs.log 2>&1 &
# echo "$!" > "$TEMPS/xwinwrap_pid"

