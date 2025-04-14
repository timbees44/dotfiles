-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Custom colourscheme
local cyberdream = require("cyberdream")

-- Register the custom scheme
config.color_schemes = {
	["Cyberdream"] = cyberdream,
}

config.color_scheme = "Cyberdream"

-- For example, changing the color scheme:
-- config.color_scheme = "Catppuccin Mocha"

-- Hide tab bar
config.enable_tab_bar = false

-- Background Image
config.window_background_image = "/Users/tim/Pictures/wallpaper/cyberpunk_city_4k.jpg"
config.window_background_opacity = 1.0
config.window_background_image_hsb = {
	brightness = 0.1, -- Reduce brightness
	hue = 1.0, -- Keep hue unchanged
	saturation = 1.0, -- Reduce saturation if necessary
}

-- Window bar
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
