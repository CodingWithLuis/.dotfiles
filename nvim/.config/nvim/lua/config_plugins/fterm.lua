require'FTerm'.setup({})

vim.keymap.set('n', '<Leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('n', '<Leader>to', '<CMD>lua require("FTerm").open()<CR>')
vim.keymap.set('n', '<Leader>tc', '<CMD>lua require("FTerm").close()<CR>')
vim.keymap.set('n', '<Leader>te', '<CMD>lua require("FTerm").exit()<CR>')
