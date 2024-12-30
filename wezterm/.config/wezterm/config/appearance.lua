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

    config.window_decorations = "NONE"
    config.enable_wayland = false
    config.window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    }

    -- wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    --     local title = tab.active_pane.title
    --     local basename = string.match(title, "[^/]+$") or title
    --     return basename
    -- end)
end

return module
