#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# TO change the date format, change it in plugins/calendar.sh instead
sketchybar --set "$NAME" label="$(date '+%d/%m %H:%M')"
