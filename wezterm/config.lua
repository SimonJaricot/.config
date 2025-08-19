local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local function move_pane(key, direction)
	return {
		key = key,
		mods = 'CTRL',
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end

config = {
	leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
	--  default_cursor_style = "BlinkingBar",
	default_cursor_style = "BlinkingUnderline",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "EaseOut",
	animation_fps = 75,
	cursor_blink_rate = 500,
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	font_size = 12.5,
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Bold" }),
	enable_tab_bar = false,
	use_fancy_tab_bar = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.95,
	initial_cols = 120,
	initial_rows = 60,
	keys = {
		{
			key = ')',
			mods = 'CTRL',
			action = wezterm.action.SplitPane {
				direction = 'Down',
			},
		},
		{
			key = '-',
			mods = 'CTRL',
			action = wezterm.action.SplitPane {
				direction = 'Right',
			},
		},
		-- adding navigation keys
		move_pane('h', 'Left'),
		move_pane('j', 'Down'),
		move_pane('k', 'Up'),
		move_pane('l', 'Right'),
	},

}

return config
