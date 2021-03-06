vim.api.nvim_set_keymap('n', '<leader><S-g>', ':G<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add .<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>g<S-a>', ':Git add -A<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gfc', ':Git commit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gpp', ':Git push<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gpo', ':Git push -u origin HEAD<CR>', {noremap = true})
