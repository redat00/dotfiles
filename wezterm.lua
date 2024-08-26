local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false

config.keys = {
  -- Split Horizontal on CTRL + SHIFT + e
  {
    key = 'e',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- Split Vertical on CTRL + SHIFT + o
  {
    key = 'o',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  -- Switch between panes on CTRL + Tab
  {
    key = 'Tab',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Next'
  },
  -- Toggle fullscreen for the current pane on CTRL + SHIFT + x
  {
    key = 'x',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.TogglePaneZoomState
  },
  -- Close current pane on CTRL + SHIFT + w
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false }
  }
}

config.color_scheme = 'Gigavolt (base16)'

return config
