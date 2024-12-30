local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.font = wezterm.font 'JetBrains Mono Nerd Font'
    config.font_size = 20
end

return module