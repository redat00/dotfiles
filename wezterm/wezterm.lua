local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.font_size = 11
config.scrollback_lines = 10000

config.keys = {
	-- Split Horizontal on CTRL + SHIFT + e
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Split Vertical on CTRL + SHIFT + o
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Switch between panes on CTRL + Tab
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Next"),
	},
	-- Toggle fullscreen for the current pane on CTRL + SHIFT + x
	{
		key = "x",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- Close current pane on CTRL + SHIFT + w
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	-- Activate the copy mode with CTRL + SHIT + a
	{
		key = "a",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateCopyMode,
	},
	--
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(win, pane)
			local pos = pane:get_cursor_position()
			local dims = pane:get_dimensions()
			local move_viewport_to_scrollback = string.rep("\r\n", pos.y - dims.physical_top)
			pane:inject_output(move_viewport_to_scrollback)
			pane:send_text("\x0c") -- CTRL-L
		end),
	},
}

config.color_scheme = "Catppuccin Mocha"
--config.color_scheme = 'Google Light (Gogh)'

return config
