local saga = require 'lspsaga'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

keymap('n', '<silent>K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
keymap('n', '<silent>gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
keymap('n', '<silent>gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('n', '<silent><C-j>', ':Lspsaga diagnostic_jump_next<CR>', opts)

