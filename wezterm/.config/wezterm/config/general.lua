local wezterm = require 'wezterm'
local mux = wezterm.mux
local module = {}

function module.apply_to_config(config)
    config.default_prog = { '/usr/bin/zsh', '-l' }

    wezterm.on('gui-startup', function()
        local tab, pane, window = mux.spawn_window({})
        window:gui_window():maximize()
    end)
end

return module
