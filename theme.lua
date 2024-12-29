local wezterm = require 'wezterm'
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "Tokyo Night (Gogh)"
        return "Bamboo"
	else
		-- return "Tokyo Night Day"
        return "Bamboo Light"
	end
end

function tab_bar_color(appearance)
	return {
        
    }
end

function winframe_color(appearance)
	if appearance:find("Dark") then
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

local appearance = get_appearance()
local tab_bar_colors = tab_bar_color(appearance)
local winframe_colors = winframe_color(appearance)
local scheme = scheme_for_appearance(appearance)

return {
    tab_bar_colors = tab_bar_colors,
    winframe = winframe_colors,
    scheme = scheme,
    appearance = appearance,
}

