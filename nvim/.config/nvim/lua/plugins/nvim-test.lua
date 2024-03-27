return {
    'vim-test/vim-test',
    dependencies = {
        'preservim/vimux'
    },
    vim.keymap.set('n', "<leader>t", ":TestNearest<CR>"),
    vim.keymap.set('n', "<leader>T", ":TestFile<CR>"),
    opts = {},
    config = function()

    end,
    vim.cmd("let test#strategy = 'vimux'")
}
