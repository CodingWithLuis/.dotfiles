return {
    'nvimdev/lspsaga.nvim',
    keys = {
        { "<leader>ca", "<cmd>Lspsaga code_action<cr>",         desc = "Code Action" },
        { "<leader>gr", "<cmd>Lspsaga rename<cr>",              desc = "Lspsaga Rename" },
        { "<C-s>d",     "<cmd>Lspsaga term_toggle lazygit<CR>", desc = true },
        { "<leader>o",  "<cmd>Lspsaga outline<cr>",             desc = "Lspsaga Outline" },
    },
    event = { "VeryLazy" },
    opts = {
        symbol_in_winbar = { enable = true },
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}
