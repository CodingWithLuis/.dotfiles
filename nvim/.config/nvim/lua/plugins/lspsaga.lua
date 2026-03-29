return {
    'nvimdev/lspsaga.nvim',
    keys = {
        { "<leader>ca", ":Lspsaga code_action<cr>" },
        { "<leader>gr", "<cmd>Lspsaga rename<cr>" },
        { "<leader>lz", "<cmd>Lspsaga term_toggle lazygit<CR>" },
        { "<leader>o",  "<cmd>Lspsaga outline<cr>" },
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
