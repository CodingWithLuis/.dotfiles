vim.api.nvim_set_keymap('n', '<C-t>', ':TestNearest<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>f', ':TestFile<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>t', ':TestSuite<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':TestLast', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':TestVisit', { noremap = true })

vim.cmd [[
let test#php#phpunit#executable = 'php artisan test'
let test#strategy = 'neovim'
let test#neovim#term_position = 'vert'
let g:test#preserve_screen = 1
]]
