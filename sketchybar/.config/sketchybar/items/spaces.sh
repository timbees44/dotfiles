#!/usr/bin/env sh

# Debugging
DEBUG_LOG="$HOME/.config/sketchybar/debug.log"
echo "=== Debugging Log: $(date) ===" >"$DEBUG_LOG"

# Colors
RED=0xffed8796
BACKGROUND_COLOR=0x44ffffff

# Function to update the focused workspace
update_focused_workspace() {
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
  echo "Focused Workspace: $FOCUSED_WORKSPACE" >>"$DEBUG_LOG"

  if [ -n "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "space.focused" icon="$FOCUSED_WORKSPACE"
  else
    echo "No focused workspace detected" >>"$DEBUG_LOG"
  fi
}

# Initial setup: Remove any previous space items
sketchybar --remove '/space\..*/'

# Add item for focused workspace
sketchybar --add item "space.focused" left \
  --set "space.focused" \
  icon.drawing=on \
  icon.padding_left=22 \
  icon.padding_right=22 \
  icon.color=$RED \
  background.color=$BACKGROUND_COLOR \
  background.corner_radius=5 \
  background.height=30 \
  background.drawing=on \
  label.drawing=off

# Store the initial focused workspace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# Polling: Set up a loop to check for workspace changes every 0.1 seconds
while true; do
  # Poll the focused workspace
  CURRENT_FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

  # Only update if the focused workspace has actually changed
  if [ "$CURRENT_FOCUSED_WORKSPACE" != "$FOCUSED_WORKSPACE" ]; then
    update_focused_workspace
    FOCUSED_WORKSPACE="$CURRENT_FOCUSED_WORKSPACE"
  fi

  # Sleep for 0.1 seconds to reduce load
  sleep 0.1
done
