return {
    'vim-test/vim-test',
    dependencies = {
        'preservim/vimux'
    },
    keys = {
        vim.keymap.set('n', "<leader>t", ":TestNearest<CR>"),
        vim.keymap.set('n', "<leader>T", ":TestFile<CR>"),
    },
    opts = {},
    vim.cmd("let test#strategy = 'vimux'")
}
