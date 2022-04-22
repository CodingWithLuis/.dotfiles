vim.api.nvim_set_keymap('n', '<C-t>', ':TestNearest<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-d>f', ':TestFile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', ':TestSuite', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':TestLast', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-b>', ':TestVisit', {noremap = true})

