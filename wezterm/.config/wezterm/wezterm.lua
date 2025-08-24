-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Sonokai (Gogh)"

-- Hide tab bar
config.enable_tab_bar = false

-- Background Image
--config.window_background_image = "Users/tim/Pictures/wallpaper/gruvbox-wallpapers/gruvbox_knights.png"
--config.window_background_image_hsb = {
--	brightness = 0.05, -- Reduce brightness
--	hue = 1.0,      -- Keep hue unchanged
--	saturation = 1.0, -- Reduce saturation if necessary
--}

-- Window bar
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
