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
    init = function()
        vim.cmd("let test#strategy = 'vimux'")
    end
}
