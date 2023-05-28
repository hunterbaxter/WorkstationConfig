local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.cursor_blink_rate = 0
config.enable_tab_bar = false
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14.0
config.scrollback_lines = 10000

-- atom one light colorscheme
config.colors = {
	foreground = "#2a2b33",
	background = "#f8f8f8",
	cursor_bg = "#2a2b33",
	cursor_border = "#2a2b33",
	cursor_fg = "#f8f8f8",
	selection_bg = "#2a2b33",
	selection_fg = "#f8f8f8",
	ansi = {
		"#000000",
		"#de3d35",
		"#3e953a",
		"#d2b67b",
		"#2f5af3",
		"#a00095",
		"#3e953a",
		"#bbbbbb",
	},
	brights = {
		"#000000",
		"#de3d35",
		"#3e953a",
		"#d2b67b",
		"#2f5af3",
		"#a00095",
		"#3e953a",
		"#ffffff",
	},
}

-- hyper dark colorscheme
-- config.colors = {
-- 	foreground = "#ffffff",
-- 	background = "#000000",
-- 	cursor_bg = "#ffffff",
-- 	cursor_border = "#ffffff",
-- 	cursor_fg = "#F81CE5",
-- 	selection_bg = "#ffffff",
-- 	selection_fg = "#000000",
-- 	ansi = {
-- 		"#000000",
-- 		"#fe0100",
-- 		"#33ff00",
-- 		"#feff00",
-- 		"#0066ff",
-- 		"#cc00ff",
-- 		"#00ffff",
-- 		"#d0d0d0",
-- 	},
-- 	brights = {
-- 		"#808080",
-- 		"#fe0100",
-- 		"#33ff00",
-- 		"#feff00",
-- 		"#0066ff",
-- 		"#cc00ff",
-- 		"#00ffff",
-- 		"#ffffff",
-- 	},
-- }

return config
