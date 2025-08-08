local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  default_cursor_style = "BlinkingBar",
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  font_size = 12.5,
  font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Bold" }),
  enable_tab_bar = true,
	use_fancy_tab_bar = false,
  window_padding = {
    left = 10,
    right = 10,
    top = 8,
    bottom = 8,
  },
	window_background_opacity = 0.95,
}

return config
