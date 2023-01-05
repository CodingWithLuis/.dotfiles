config = function()
    require("trouble").setup {
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        action_keys = { -- key mappings for actions in the trouble list
            -- map to {} to remove a mapping, for example:
            -- close = {},
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
            open_split = { "<c-x>" }, -- open buffer in new split
            open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
            open_tab = { "<c-t>" }, -- open buffer in new tab
            jump_close = { "o" }, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P", -- toggle auto_preview
            hover = "K", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            close_folds = { "zM", "zm" }, -- close all folds
            open_folds = { "zR", "zr" }, -- open all folds
            toggle_fold = { "zA", "za" }, -- toggle fold of current file
            previous = "k", -- preview item
            next = "j" -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = ""
        },
        use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client}
    }
end

local set = vim.keymap.set

-- Lua
set("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
set("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
    { silent = true, noremap = true })
set("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
    { silent = true, noremap = true })
set("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true })
set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true })
set("n", "gR", "<cmd>Trouble lsp_references<cr>",
    { silent = true, noremap = true })

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble }
        },
        preview = { treesitter = true }
    },
    extensions = {
        ["laravel-docs"] = {
            version = "9.x", -- one of: "6.x", "7.x", "8.x", "9.x", "master"
            preview = true, -- show telescope preview
            preview_with_glow = true, -- use glow as telescope previewer
            directory = "$HOME/.cache/laravel-docs" -- where to clone the laravel docs github repo
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = false,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                }
            }
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown {} }
    }
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "laravel-docs"
require("telescope").load_extension("ui-select")

--
set("n", "<space>fb", ":Telescope file_browser<cr>",
    { silent = true, noremap = true })

set("n", "<Leader>ld", "<Cmd>Telescope laravel-docs<CR>")
