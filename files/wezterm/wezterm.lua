local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 11.0
config.enable_tab_bar = false

local mux = wezterm.mux
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window {}
	window:gui_window():maximize()
end)

return config
