-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:

-- Neovim colors.
config.colors = {
    foreground = "#EEF1F8",
    background = "#14161B",
    ansi = {
        '#07080D',
        '#F08080',
        '#B3F6C0',
        '#FCE094',
        '#87CEFA',
        '#ffcaff',
        "#8cf8f7",
        '#eef1f8',
    },
    brights = {
        '#4F5258',
        '#F08080',
        '#B3F6C0',
        '#FCE094',
        '#87CEFA',
        '#ffcaff',
        "#8cf8f7",
        '#eef1f8',
    },
}
config.colors.cursor_bg = config.colors.foreground
config.colors.cursor_border = config.colors.foreground
config.colors.split = config.colors.foreground

-- Hide tab bar
config.enable_tab_bar = false

-- Transparency
config.window_background_opacity = 0.9

-- Window bar
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
