-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-mocha"
config.font =
	wezterm.font("ComicShannsMono Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16.0

config.initial_cols = 132
config.initial_rows = 32

config.keys = {
	{
		key = "i",
		mods = "SHIFT|ALT",
		action = act.Multiple({
			act.SplitPane({
				direction = "Down",
				size = { Cells = 12 },
			}),
			act.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		}),
	},
	-- This WezTerm build sends Shift+Enter as a plain Enter. Cursor CLI
	-- treats the CSI-u sequence as a newline instead of submitting.
	{
		key = "Enter",
		mods = "SHIFT",
		action = act.SendString("\x1b[13;2u"),
	},
}

-- and finally, return the configuration to wezterm
return config
