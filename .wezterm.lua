-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local default_mod = 'ALT'



-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'rose-pine'
config.color_scheme = 'Catppuccin Macchiato'
config.enable_wayland=true
-- config.color_scheme = 'nord'
-- Possible themes:
-- Butrin
-- Blazer
-- Catpuccin
-- earthsong
--espresso
-- fairy floss dark
-- gotham
-- config.default_prog = {'/usr/bin/zellij'}
config.default_prog = {'/usr/bin/fish'}
-- config.default_prog = {'/usr/bin/xonsh'}
-- config.set_environment_variables = {COLORTERM="truecolor", TERM="xterm-24bit"}
-- config.window_background_image = '/home/vivien/backgrounds/tma-tape.jpeg'
-- config.window_background_image = "/home/vivien/Pictures/backgrounds/dracula-wallpaper/second-collection/soft-waves/dracula-soft-waves-44475a.png"
-- config.window_background_image = "/home/vivien/Pictures/backgrounds/rosepine/rose_pine_circle.png"
config.window_background_opacity = 0.9



-- config.use_fancy_tab_bar = false

config.keys = {
  {key = 'c', mods=default_mod, action=act.CopyTo 'ClipboardAndPrimarySelection',},
  {key = 'v', mods=default_mod, action=act.PasteFrom 'Clipboard',},

  {key = 't', mods=default_mod, action =act.SpawnTab 'CurrentPaneDomain',},
  {key = 'w', mods=default_mod, action=act.CloseCurrentTab {confirm = false},},
  {key='q', mods='CTRL|SHIFT', action=act.QuitApplication},

  {key = 'F', mods=default_mod, action=act.Search{CaseSensitiveString=""}},

  { key = '(', mods = default_mod, action = act.ActivateTabRelative(-1)},
  { key = ')', mods = default_mod, action = act.ActivateTabRelative(1)},

  {key='x', mods="ALT|SHIFT", action=act.ActivateCommandPalette},

  {key = '+', mods=default_mod, action=act.IncreaseFontSize},
  {key = '-', mods=default_mod, action=act.DecreaseFontSize},
  {key = '=', mods=default_mod, action=act.ResetFontSize},
  { key = "F11", mods = "NONE", action = act.ToggleFullScreen },

}


config.use_fancy_tab_bar = true
config.window_frame = {
  font_size = 9.0
}

config.key_tables = {
    search_mode = {
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
      { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
      { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
      { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
      {
        key = 'PageUp',
        mods = 'NONE',
        action = act.CopyMode 'PriorMatchPage',
      },
      {
        key = 'PageDown',
        mods = 'NONE',
        action = act.CopyMode 'NextMatchPage',
      },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    },
  }

config.adjust_window_size_when_changing_font_size = false


-- config.colors = {
--   -- The default text color
--   foreground = '#f8f8f0',
--   -- The default background color
--   background = '#21272e',

--   -- Overrides the cell background color when the current cell is occupied by the
--   -- cursor and the cursor style is set to Block
--   cursor_bg = '#e74c3c',
--   -- Overrides the text color when the current cell is occupied by the cursor
--   cursor_fg = 'black',
--   -- Specifies the border color of the cursor when the cursor style is set to Block,
--   -- or the color of the vertical or horizontal bar when the cursor style is set to
--   -- Bar or Underline.
--   cursor_border = '#e74c3c',

--   -- the foreground color of selected text
--   selection_fg = '#56b6c2',
--   -- the background color of selected text
--   selection_bg = '#f8f8f0',

--   -- The color of the scrollbar "thumb"; the portion that represents the current viewport
--   scrollbar_thumb = '#222222',

--   -- The color of the split lines between panes
--   split = '#444444',

--   ansi = {
--     'black',
--     'maroon',
--     'green',
--     'olive',
--     'navy',
--     'purple',
--     'teal',
--     'silver',
--   },
--   brights = {
--     'grey',
--     'red',
--     'lime',
--     'yellow',
--     'blue',
--     'fuchsia',
--     'aqua',
--     'white',
--   },

--   -- Arbitrary colors of the palette in the range from 16 to 255

--   -- Since: 20220319-142410-0fcdea07
--   -- When the IME, a dead key or a leader key are being processed and are effectively
--   -- holding input pending the result of input composition, change the cursor
--   -- to this color to give a visual cue about the compose state.
--   compose_cursor = 'orange',

--   -- Colors for copy_mode and quick_select
--   -- available since: 20220807-113146-c2fee766
--   -- In copy_mode, the color of the active text is:
--   -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
--   -- 2. selection_* otherwise
--   copy_mode_active_highlight_bg = { Color = '#56b6c2' },
--   -- use `AnsiColor` to specify one of the ansi color palette values
--   -- (index 0-15) using one of the names "Black", "Maroon", "Green",
--   --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
--   -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
--   copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
--   -- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
--   copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

--   quick_select_label_bg = { Color = 'peru' },
--   quick_select_label_fg = { Color = '#ffffff' },
--   quick_select_match_bg = { AnsiColor = 'Navy' },
--   quick_select_match_fg = { Color = '#ffffff' },
-- }



-- and finally, return the configuration to wezterm
return config
