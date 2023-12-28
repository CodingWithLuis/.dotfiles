return {
    'nvimdev/lspsaga.nvim',
    keys = {
        { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
        { "<leader>gr", "<cmd>Lspsaga rename<cr>",      desc = "Lspsaga Rename" },
    },
    event = { "VeryLazy" },
    opts = {
        symbol_in_winbar = { enable = false },
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}
