local wezterm = require("wezterm")
local act = wezterm.action
local keys = {
	{
		key = "C",
		mods = "CTRL | SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local ansi = window:get_selection_escapes_for_pane(pane)
			window:copy_to_clipboard(ansi)
		end),
	},
	-- paste from the clipboard
	{ key = "V", mods = "CTRL | SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "n", mods = "ALT", action = act.SpawnTab("DefaultDomain") },
	{ key = "q", mods = "ALT", action = act.CloseCurrentTab({ confirm = false }) },
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
	{ key = "w", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },

	--Rotate panes
	{
		key = "b",
		mods = "CTRL",
		action = act.RotatePanes("CounterClockwise"),
	},

	{ key = "n", mods = "CTRL", action = act.RotatePanes("Clockwise") },
}

local mouse = {
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

return {
	keys = keys,
	mouse = mouse,
}
