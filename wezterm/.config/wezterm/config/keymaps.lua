local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.keys = {
        -- Split panes
        { key = "d",     mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = "d",     mods = "CTRL|ALT",   action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

        -- Switch panes
        { key = "h",     mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Left") },
        { key = "l",     mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Right") },
        { key = "k",     mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Up") },
        { key = "j",     mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Down") },

        -- Tabs
        { key = "t",     mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
        { key = "w",     mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } },

        -- Copy/Paste
        { key = "c",     mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
        { key = "v",     mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

        -- Zoom Pane
        { key = "Enter", mods = "CTRL|SHIFT", action = "TogglePaneZoomState" },
    }
end

return module
