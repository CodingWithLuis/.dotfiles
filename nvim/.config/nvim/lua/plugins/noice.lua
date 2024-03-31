return {
    {
        "folke/noice.nvim",
        event = 'VeryLazy',
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                progress = {
                    enabled = false
                },
                signature = {
                    enabled = false,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = false,
                },
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    long_message_to_split = true, -- long messages will be sent to a split
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
                cmdline = {
                    view = "cmdline",
                },
                messages = {
                    enabled = true,            -- enables the Noice messages UI
                    view = "notify",           -- default view for messages
                    view_error = "notify",     -- view for errors
                    view_warn = "notify",      -- view for warnings
                    view_history = "messages", -- view for :messages
                    view_search = false,       -- view for search count messages. Set to `false` to disable
                },
            },
        },
    },
}
