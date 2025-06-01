local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { "/bin/zsh", "-l", "-c", "zellij" }

-- Settings go here:
config.default_prog = { "/home/vishnukvs/.nix-profile/bin/fish" }

-- Add more settings here, for example:
config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0
--config.color_scheme = 'Gruvbox Dark (Gogh)'
config.color_scheme = 'Galaxy'
--config.window_background_opacity = 0.95
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
