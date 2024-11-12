return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "nvim-treesitter/playground" },
        { "windwp/nvim-ts-autotag" },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "html",
            "blade",
            "javascript",
            "json",
            "lua",
            "xml",
            "http",
            "graphql",
            "markdown",
            "markdown_inline",
            "python",
            "typescript",
            "vim",
            "php",
            "vue",
        },
        autotag = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        refactor = {
            highlight_definitions = { enable = true },
            smart_name = { enable = true, keymaps = { smart_name = "grr" } }
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["of"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ob"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["oc"] = "@class.outer",
                    ["ic"] = {
                        query = "@class.inner",
                        desc = "Select inner part of a clss region"
                    },
                    ["op"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                    ["ol"] = "@loop.outer",
                    ["il"] = "@loop.inner"
                },
            }
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25,
            persist_queries = false,
            keybindings = {
                toggle_query_editor = 'o',
                toggle_hl_groups = 'i',
                toggle_injected_languages = 't',
                toggle_anonymous_nodes = 'a',
                toggle_language_display = 'I',
                focus_language = 'f',
                unfocus_language = 'F',
                update = 'R',
                goto_node = '<cr>',
                show_help = '?'
            }
        }
    },
    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
        require 'nvim-treesitter.install'.compilers = { 'zig' }
    end,
}
