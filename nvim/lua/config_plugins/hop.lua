-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('n', '<leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>w1', "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>w2', "<cmd>lua require'hop'.hint_char2()<cr>", {})

