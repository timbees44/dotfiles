#!/bin/bash

POPUP_OFF='sketchybar --set alien.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

alien_logo=(
  icon=$ALIEN
  #icon.font="$FONT:Black:36.0"
  #icon.color="#37f499"
  padding_right=15
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  popup.height=35
)

alien_prefs=(
  icon=$PREFERENCES
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

alien_activity=(
  icon=$ACTIVITY
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

alien_lock=(
  icon=$LOCK
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

sketchybar --add item alien.logo left \
  --set alien.logo "${alien_logo[@]}" \
  \
  --add item alien.prefs popup.alien.logo \
  --set alien.prefs "${alien_prefs[@]}" \
  \
  --add item alien.activity popup.alien.logo \
  --set alien.activity "${alien_activity[@]}" \
  \
  --add item alien.lock popup.alien.logo \
  --set alien.lock "${alien_lock[@]}"
