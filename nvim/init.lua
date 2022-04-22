lua = require'impatient'

vim.g.mapleader = ' '

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options


lua = require 'plugins'
require('config_plugins.lualine')
require('config_plugins.treesitter')
require('config_plugins.nvim-cmp')
require('config_plugins.telescope')
-- require('config_plugins.kommentary')
require('config_plugins.comment')
require('config_plugins.trouble') 
require('config_plugins.hop')
require('config_plugins.nvim-tree')
require('config_plugins.formatter')
require('config_plugins.harpoon')
require('config_plugins.refactoring')
require('config_plugins.test')
require('config_plugins.terminal')
require('mappings.general')
require('mappings.fugitive')


require("indent_blankline").setup {
  char = "|",
}

require'hop'.setup()
require("telescope").load_extension('harpoon')
require("telescope").load_extension("flutter")

require('gitsigns').setup()
require('refactoring').setup({})

require("luasnip/loaders/from_vscode").lazy_load() 
require'luasnip'.filetype_extend("php", {"blade"})

g.completion_trigger_character = '<Tab>' 

-- cmd 'au BufWritePre *.dart :DartFmt'

vim.cmd[[
    let g:python3_host_prog = "/usr/bin/python3.8"
]]


--cmd[[autocmd BufNewFile,BufRead *.blade.php set ft=blade]]
-- cmd[[autocmd BufNewFile,BufRead *.js set ft=javascript]]
-- cmd[[autocmd CursorHold * silent! checktime]]
-- cmd[[autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()]]
-- cmd[[autocmd CursorHold,CursorHoldI *.php :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }]]

require("gruvqueen").setup({
    config = {
        disable_bold = true,
        italic_comments = true,
        italic_keywords = true,
        italic_functions = true,
        italic_variables = true,
        invert_selection = false,
        style = 'original', -- possible values: 'original', 'mix', 'material'
        -- transparent_background = true,
        -- bg_color = "black",
    },
})


