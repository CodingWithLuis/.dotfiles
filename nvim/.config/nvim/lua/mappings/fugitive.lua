local map = vim.keymap

map.set('n', '<leader><S-g>', ':G<CR>', { noremap = true })
map.set('n', '<leader>ga', ':Git add .<CR>', { noremap = true })
map.set('n', '<leader>g<S-a>', ':Git add -A<CR>', { noremap = true })
map.set('n', '<leader>gfc', ':Git commit<CR>', { noremap = true })
map.set('n', '<leader>gpp', ':Git push<CR>', { noremap = true })
map.set('n', '<leader>gpo', ':Git push -u origin HEAD<CR>', { noremap = true })
