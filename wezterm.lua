-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
function get_appearance()
if wezterm.gui then
  return wezterm.gui.get_appearance()
  end
  return 'Dark'
end
  
function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night (Gogh)' 
  else
    return 'Tokyo Night Day'
  end
end

function tab_bar_color(appearance)
	if appearance:find 'Dark' then
	  return {
		--same as tokyonight_Gogh
		inactive_tab_edge = "#1f2335",
		active_tab = {
			bg_color = "#1f2335",
			fg_color = "#ad9dff",
		},
		inactive_tab = {
			bg_color = "#1f2335",
			fg_color = "#4b5263",
		},
		inactive_tab_hover = {
			bg_color = "#444444",
			fg_color = "#c0caf5",
		},
		new_tab = {
			bg_color = "#1f2335",
			fg_color = "#c0caf5",
		},
	}
	else
	  return {
		-- same as tokyonight_day
		inactive_tab_edge = "#c0caf5",
		active_tab = {
			bg_color = "#c0caf5",
			fg_color = "#1f2335",
		},
		inactive_tab = {
			bg_color = "#c0caf5",
			fg_color = "#FDFDFD",
		},
		inactive_tab_hover = {
			bg_color = "#444444",
			fg_color = "#c0caf5",
		},
		new_tab = {
			bg_color = "#c0caf5",
			fg_color = "#1f2335",
		},
	  }
	end
end

function winframe_color(appearance)
	if appearance:find 'Dark' then
	  return {
		--same as tokyonight_Gogh
		active_titlebar_bg = "#1f2335",
		inactive_titlebar_bg = "#1f2335",
	}
	else
	  return {
		-- same as tokyonight_day
		active_titlebar_bg = "E3E3E8",
		inactive_titlebar_bg = "E3E3E8",
	  }
	end
end
config.color_scheme = scheme_for_appearance(get_appearance())
config.font = wezterm.font("Hack Nerd Font")
config.colors = {
	tab_bar = tab_bar_color(get_appearance())
}
config.window_frame = winframe_color(get_appearance())
local act = wezterm.action
config.enable_scroll_bar = true
config.min_scroll_bar_height = "0.5cell"
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},
	-- paste from the clipboard
	{ key = "V", mods = "CTRL | SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "n", mods = "ALT", action = act.SpawnTab("DefaultDomain") },
	{ key = "q", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "<", mods = "CTRL | SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = ">", mods = "CTRL | SHIFT", action = act.ActivateTabRelative(1) },
	{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = act.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = act.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = act.ActivateTab(7) },
	{ key = "9", mods = "ALT", action = act.ActivateTab(-1) },
	
	--close current pane
	{key = "w", mods = "CTRL | SHIFT", action = act.CloseCurrentPane { confirm = true }},

	--Rotate panes
	{
		key = 'b',
		mods = 'CTRL',
		action = act.RotatePanes 'CounterClockwise',
	},

	{ key = 'n', mods = 'CTRL', action = act.RotatePanes 'Clockwise' },}
config.alternate_buffer_wheel_scroll_speed = 1
config.font_size = 10

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(-3),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(3),
	},
}
config.window_background_opacity = 0.95
-- and finally, return the configuration to wezterm
return config
