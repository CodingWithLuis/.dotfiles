local wezterm = require 'wezterm'
local module = {}

-- Catppuccin colors
local colors = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
    text = "#cdd6f4",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#6c7086",
    surface2 = "#585b70",
    surface1 = "#45475a",
    surface0 = "#313244",
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b",
}

function module.apply_to_config(config)
    -- Tab bar settings
    config.tab_bar_at_bottom = false
    config.use_fancy_tab_bar = true
    config.tab_max_width = 32
    config.hide_tab_bar_if_only_one_tab = false

    -- Colors configuration
    config.colors = {
        tab_bar = {
            background = colors.base,
            active_tab = {
                bg_color = colors.surface1,
                fg_color = colors.text,
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },
            inactive_tab = {
                bg_color = colors.base,
                fg_color = colors.overlay0,
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false,
            },
            inactive_tab_hover = {
                bg_color = colors.surface0,
                fg_color = colors.text,
                intensity = "Normal",
                underline = "None",
                italic = true,
                strikethrough = false,
            },
            new_tab = {
                bg_color = colors.base,
                fg_color = colors.text,
            },
            new_tab_hover = {
                bg_color = colors.surface0,
                fg_color = colors.text,
                italic = true,
            },
        },
    }

    -- Tab style
    config.tab_bar_style = {
        new_tab = " + ",
        new_tab_hover = " + ",
    }

    -- Custom tab title format with nil checks
    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        -- Safe access to tab properties
        if not tab or not tab.active_pane then
            return {
                { Text = " ? " }
            }
        end

        local title = get_basename(tab.active_pane.title)
        local process = tab.active_pane.foreground_process_name or ""

        -- Clean up the process name if present
        if process ~= "" then
            process = get_basename(process)
            title = string.format("%s (%s)", title, process)
        end

        -- Truncate if too long
        if #title > 20 then
            title = string.sub(title, 1, 17) .. "..."
        end

        return {
            { Text = string.format(" %d: %s ", tab.tab_index + 1, title) }
        }
    end)
end

return module
