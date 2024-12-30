local wezterm = require 'wezterm'
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
    config.leader = { key = 's', mods = 'CTRL' }

    config.keys = {
        -- Split panes
        { key = "h", mods = "LEADER",     action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = "v", mods = "LEADER",     action = act.SplitVertical { domain = "CurrentPaneDomain" } },

        -- Switch panes
        { key = "h", mods = "ALT",        action = act.ActivatePaneDirection("Left") },
        { key = "l", mods = "ALT",        action = act.ActivatePaneDirection("Right") },
        { key = "k", mods = "ALT",        action = act.ActivatePaneDirection("Up") },
        { key = "j", mods = "ALT",        action = act.ActivatePaneDirection("Down") },

        -- Tabs
        { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab { confirm = true } },
        {
            key = 'r',
            mods = 'ALT',
            action = act.PromptInputLine {
                description = 'Enter new name for tab',
                action = wezterm.action_callback(function(window, pane, line)
                    if line then
                        window:active_tab():set_title(line)
                    end
                end),
            },
        },

        -- Copy/Paste
        { key = "c",     mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
        { key = "v",     mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

        -- Zoom Pane
        { key = "Enter", mods = "CTRL|SHIFT", action = "TogglePaneZoomState" },

        --resize panes with key table
        {
            key = 'r',
            mods = 'LEADER',
            action = act.ActivateKeyTable {
                name = 'resize_pane', one_shot = false, timeout_milliseconds = 1000,
            }
        },

        --move tabs with key table
        {
            key = "m",
            mods = "LEADER",
            action = act.ActivateKeyTable {
                name = "move_tab",
                one_shot = false,
                timeout_milliseconds = 1000, }
        },
    }

    for i = 1, 9 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = "LEADER",
            action = act.ActivateTab(i - 1)
        })
    end

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
