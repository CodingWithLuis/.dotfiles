local saga = require 'lspsaga'

local keymap = vim.keymap.set

saga.init_lsp_saga({
    border_style = "rounded",
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    code_action_icon = ""
})

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>",
    { silent = true })

-- Show cursor diagnostics
keymap("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",
    { silent = true })

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({
        severity = vim.diagnostic.severity.ERROR
    })
end, { silent = true })

keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({
        severity = vim.diagnostic.severity.ERROR
    })
end, { silent = true })

-- Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Hover Doc
keymap("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
-- keymap("n", "<S-o>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want to pass some cli command into a terminal you can do it like this
-- open lazygit in lspsaga float terminal
keymap("n", "<C-s>d", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<C-s>p", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]],
    { silent = true })
