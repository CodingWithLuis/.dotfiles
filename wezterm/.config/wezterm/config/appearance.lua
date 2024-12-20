local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.term = 'xterm-256color'
    config.color_scheme = 'Tokyo Night Moon'

    config.background = {
        {
            source = {
                File = wezterm.config_dir .. "/backgrounds/urahara.jpg"
            },
            hsb = {
                hue = 1.0,
                saturation = 1.02,
                brightness = 0.25
            },
            width = "100%",
            height = "100%"
        },
        {
            source = {
                Color = "#282c35"
            },
            width = "100%",
            height = "100%",
            opacity = 0.50
        }
    }

    config.window_decorations = "RESIZE"
    config.hide_tab_bar_if_only_one_tab = true
end

return module
