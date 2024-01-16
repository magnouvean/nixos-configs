local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 11.0
config.enable_tab_bar = false

return config
