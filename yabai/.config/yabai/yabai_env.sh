#!/usr/bin/env bash

# To get the names of all the running applications
# yabai -m query --windows | jq -r '.[].app'

# apps_transparent="(Spotify|kitty|Neovide|Google Chrome|Code|WezTerm|Ghostty)"
apps_transparent="(Spotify|Ghostty|Brave Browser)"

# Apps excluded from window management, so you can resize them and move them around
# This is basically the ignore list

# I had to move them away from normal, because all these apps would stay on top
# of other apps
# apps_mgoff_normal="()"

# This keeps apps always below, seems to be working fine when I switch to other
# apps
apps_mgoff_below="(Calculator|iStat Menus|Activity Monitor|App StoreSoftware Update|CleanShot X|Raycast|Stickies|Brave Browser)"

# This keeps apps always on the top
apps_mgoff_above="()"
