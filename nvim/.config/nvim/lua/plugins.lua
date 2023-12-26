local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
        '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'Murtaza-Udaipurwala/gruvqueen'

    use { "jiaoshijie/undotree" }

    use('neovim/nvim-lspconfig')
    use { "williamboman/mason.nvim" }
    use "williamboman/mason-lspconfig.nvim"

    use('nvimtools/none-ls.nvim')

    use('MunifTanjim/prettier.nvim')

    use { 'glepnir/lspsaga.nvim' }

    use 'windwp/nvim-ts-autotag'

    use({
        "gbprod/phpactor.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- required to update phpactor
            "neovim/nvim-lspconfig"  -- required to automaticly register lsp serveur
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
    -- use "Kibadda/laravel-docs.nvim"
    --
    use {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function() require("colortils").setup() end
    }

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
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin
    use "rafamadriz/friendly-snippets"
    use 'onecentlin/laravel-blade-snippets-vscode'
    use 'onecentlin/laravel5-snippets-vscode'

    use 'nvim-telescope/telescope.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use {
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        ft = 'http',
        config = function()
            require('rest-nvim').setup({
                result_split_horizontal = false,
                result_split_in_place = false,
                skip_ssl_verification = false,
                encode_url = true,
                highlight = { enabled = true, timeout = 150 },
                result = {
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                    formatters = {
                        json = "jq",
                        html = function(body)
                            return vim.fn
                                .system({ "tidy", "-i", "-q", "-" }, body)
                        end
                    }
                },
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true
            })
        end
    }

    use { 'stevearc/dressing.nvim' }

    use 'nvim-lualine/lualine.nvim'

    use 'lukas-reineke/indent-blankline.nvim'

    use "folke/trouble.nvim"

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use { 'numToStr/Comment.nvim' }

    use { 'nvim-tree/nvim-web-devicons' }

    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons' -- optional, for file icons
    --     }
    -- }

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

    use 'jlcrochet/vim-razor'

    use 'camgraff/telescope-tmux.nvim'

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }
    })

    use 'lewis6991/impatient.nvim'

    use 'numToStr/FTerm.nvim'

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
