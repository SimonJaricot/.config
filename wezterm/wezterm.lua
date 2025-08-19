local wezterm = require("wezterm")
local config = require("config")

config.color_scheme = "catppuccin-frappe"
config.macos_window_background_blur = 30

-- wezterm.on('update-status', function(window)
--   -- Grab the utf8 character for the "powerline" left facing
--   -- solid arrow.
--   local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
--
--   -- Grab the current window's configuration, and from it the
--   -- palette (this is the combination of your chosen colour scheme
--   -- including any overrides).
--   local color_scheme_palette = window:effective_config().resolved_palette
--   local bg = color_scheme_palette.background
--   local fg = color_scheme_palette.foreground
--
--   window:set_right_status(wezterm.format({
--     -- First, we draw the arrow...
--     { Background = { Color = 'none' } },
--     { Foreground = { Color = bg } },
--     { Text = SOLID_LEFT_ARROW },
--     -- Then we draw our text
--     { Background = { Color = bg } },
--     { Foreground = { Color = fg } },
--     { Text = ' ' .. wezterm.hostname() .. ' ' },
--   }))
-- end)


-- config.window_frame = {
--   -- The font used in the tab bar.
--   -- Roboto Bold is the default; this font is bundled
--   -- with wezterm.
--   -- Whatever font is selected here, it will have the
--   -- main font setting appended to it to pick up any
--   -- fallback fonts you may have used there.
--   font = wezterm.font { family = 'Roboto', weight = 'Bold' },
--
--   -- The size of the font in the tab bar.
--   -- Default to 10.0 on Windows but 12.0 on other systems
--   font_size = 12.0,
--
--   -- The overall background color of the tab bar when
--   -- the window is focused
--   active_titlebar_bg = '#FF0000',
--
--   -- The overall background color of the tab bar when
--   -- the window is not focused
--   inactive_titlebar_bg = '#333333',
-- }
--

return config
