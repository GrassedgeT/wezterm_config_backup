-- Pull in the wezterm API
local wezterm = require("wezterm")
-- require("tab-title").setup()
-- This will hold the configuration.
local config = wezterm.config_builder()
local key_config = require("keymaps")
local theme_config = require("theme")
local ssh_domains = require("ssh_domains")
print(theme_config.scheme)

-- This is where you actually apply your config choices
-- keybindings relative things
config.keys = key_config.keys
config.mouse_bindings = key_config.mouse

-- theme relative things
config.color_scheme = theme_config.scheme
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 12
config.front_end = "WebGpu"
-- config.colors = {
-- 	tab_bar = {
-- 		background = "#292F3C",
-- 	}
-- }

-- window and tab_bar relative things
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 8,
}
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_frame = theme_config.winframe
config.enable_scroll_bar = true
config.min_scroll_bar_height = "0.5cell"
config.alternate_buffer_wheel_scroll_speed = 1
config.window_background_opacity = 0.9
config.macos_window_background_blur = 70

-- domains configurations
config.ssh_domains = ssh_domains

-- enable wayland
-- config.enable_wayland = false
--finally, return the configuration to wezterm
return config
