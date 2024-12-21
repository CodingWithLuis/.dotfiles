local wezterm = require 'wezterm'
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
    config.leader = { key = 'a', mods = 'CTRL' }

    config.keys = {
        -- Split panes
        { key = "h",     mods = "LEADER",     action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = "v",     mods = "LEADER",     action = act.SplitVertical { domain = "CurrentPaneDomain" } },

        -- Switch panes
        { key = "h",     mods = "ALT",        action = act.ActivatePaneDirection("Left") },
        { key = "l",     mods = "ALT",        action = act.ActivatePaneDirection("Right") },
        { key = "k",     mods = "ALT",        action = act.ActivatePaneDirection("Up") },
        { key = "j",     mods = "ALT",        action = act.ActivatePaneDirection("Down") },

        -- Tabs
        { key = "t",     mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "w",     mods = "CTRL|SHIFT", action = act.CloseCurrentTab { confirm = true } },

        -- Copy/Paste
        { key = "c",     mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
        { key = "v",     mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

        -- Zoom Pane
        { key = "Enter", mods = "CTRL|SHIFT", action = "TogglePaneZoomState" },

        {
            key = 'r',
            mods = 'LEADER',
            action = act.ActivateKeyTable {
                name = 'resize_pane', one_shot = false, timeout_milliseconds = 1000,
            }
        },
    }

    config.key_tables = {
        resize_pane = {
            { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
            { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
            { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
            { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
            { key = "Escape", action = "PopKeyTable" },
            { key = "Enter",  action = "PopKeyTable" },
        },
        move_tab = {
            { key = "h",      action = act.MoveTabRelative(-1) },
            { key = "j",      action = act.MoveTabRelative(-1) },
            { key = "k",      action = act.MoveTabRelative(1) },
            { key = "l",      action = act.MoveTabRelative(1) },
            { key = "Escape", action = "PopKeyTable" },
            { key = "Enter",  action = "PopKeyTable" },
        }
    }
end

return module
