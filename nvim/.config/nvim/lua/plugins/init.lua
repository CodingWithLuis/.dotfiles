return {
    'neovim/nvim-lspconfig',
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies =
        {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig'
        },
    },
    'tpope/vim-surround',
    { 'tpope/vim-repeat',                         event = "VeryLazy" },
    { 'tpope/vim-projectionist',                  event = "VeryLazy" },
    { 'tpope/vim-fugitive',                       event = "VeryLazy" },

    { 'mhinz/vim-signify', },

    { 'noahfrederick/vim-composer' },
    { 'noahfrederick/vim-laravel',                ft = { 'php' } },

    { 'onecentlin/laravel-blade-snippets-vscode', ft = { 'php' } },
    { 'onecentlin/laravel5-snippets-vscode',      ft = { 'php' } },

    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },

    'nvim-lua/plenary.nvim',
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
            enable_autocmd = false,
        }
    },
}
