local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'ThePrimeagen/vim-be-good'

    use 'Murtaza-Udaipurwala/gruvqueen'

    use { "jiaoshijie/undotree" }

    use('neovim/nvim-lspconfig')
    use { "williamboman/mason.nvim" }
    use "williamboman/mason-lspconfig.nvim"

    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    use { 'glepnir/lspsaga.nvim' }

    use 'windwp/nvim-ts-autotag'

    use({
        "gbprod/phpactor.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- required to update phpactor
            "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
        }
    })

    use "Shatur/neovim-session-manager"

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-projectionist'

    use 'noahfrederick/vim-composer'
    use 'noahfrederick/vim-laravel'
    use "Kibadda/laravel-docs.nvim"

    use 'vim-test/vim-test'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter-refactor' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    use 'mhartington/formatter.nvim'

    use { 'creativenull/diagnosticls-configs-nvim' }

    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' }, { 'nvim-treesitter/nvim-treesitter' }
        }
    }

    use {
        'ThePrimeagen/harpoon',
        requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' }
    }

    use { 'LunarWatcher/auto-pairs', branch = 'develop' }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'

    -- Snippets.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use "rafamadriz/friendly-snippets"
    use 'onecentlin/laravel-blade-snippets-vscode'
    use 'onecentlin/laravel5-snippets-vscode'

    use 'nvim-telescope/telescope.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use 'nvim-lualine/lualine.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use "folke/trouble.nvim"

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use { 'numToStr/Comment.nvim' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        }
    }

    use({
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup({
                copy_sync = { enable = false },
                navigation = { enable_default_keybindings = true },
                resize = { enable_default_keybindings = true }
            })
        end
    })

    use 'camgraff/telescope-tmux.nvim'

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }
    })

    use 'lewis6991/impatient.nvim'

    -- Git Integration
    use 'tpope/vim-fugitive'
    use 'mhinz/vim-signify'
    use "lewis6991/gitsigns.nvim"

    -- flutter
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'dart-lang/dart-vim-plugin'
    use 'Nash0x7E2/awesome-flutter-snippets'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)
