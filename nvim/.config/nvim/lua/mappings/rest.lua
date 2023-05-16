vim.keymap.set('n', ';rr', ":lua require('rest-nvim').run()<CR>",
    { silent = true })

vim.keymap.set('n', ';rl', ":lua require('rest-nvim').last()<CR>",
    { silent = true })

vim.keymap.set('n', ';rp', ":lua require('rest-nvim').run(true)<CR>",
    { silent = true })
