return {
    'smoka7/hop.nvim',
    keys = {
        { '<leader>w',  "<cmd>lua require'hop'.hint_words()<cr>", desc = "Hop hint words" },
        { '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", desc = "Hop hint lines" },
        { '<leader>w1', "<cmd>lua require'hop'.hint_char1()<cr>", desc = "Hop hint char 1" },
        { '<leader>w2', "<cmd>lua require'hop'.hint_char2()<cr>", desc = "Hop hint char 2" }
    },
    version = "*",
    opts = {},
}
