-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "nightfox"
config.font =
	wezterm.font("ComicShannsMono Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16.0

config.keys = {
	{
		key = "i",
		mods = "SHIFT|ALT",
		action = act.Multiple({
			act.SplitPane({
				direction = "Down",
				size = { Percent = 25 },
			}),
			act.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		}),
	},
}

-- and finally, return the configuration to wezterm
return config
