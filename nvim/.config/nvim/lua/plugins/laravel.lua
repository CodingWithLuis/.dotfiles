return {
    "adalessa/laravel.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
        "kevinhwang91/promise-async",
    },
    -- cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    cmd = { "Laravel" },
    keys = {
        { "<leader>la", ":Laravel artisan<cr>" },
        { "<leader>lr", ":Laravel routes<cr>" },
        { "<leader>lm", ":Laravel related<cr>" },
        { "<leader>lc", ":LaravelMyCommands<cr>" },
    },
    event = { "VeryLazy" },
    opts = {
        features = {
            null_ls = {
                enable = false,
            }
        },
    },
    config = true,
}
