#!/bin/bash

killall xwinwrap
killall feh
killall picom

is_battery=$(upower -d | grep on-battery | cut -d ':' -f 2 | cut -d ' ' -f 7-)

if [ "$is_battery" = "no" ] ; then
	./ac_mode.sh
else
	./battery_mode.sh
fi
