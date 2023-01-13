require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = { "vue" },
        additional_vim_regex_hightlight = true
    },
    indent = { enable = false, disable = {} },
    autotag = { enable = true },
    ensure_installed = {
        "php", "json", "yaml", "html", "css", "vue", "typescript", "lua"
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = { blade = { __default = '{{-- %s --}}', comment = '// %s' } }
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = { enable = true, keymaps = { smart_rename = "grr" } }
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
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = {
                    query = "@class.inner",
                    desc = "Select inner part of a class region"
                },
                ["op"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["ol"] = "@loop.outer",
                ["il"] = "@loop.inner"
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            -- selection_modes = {
            --     ['@parameter.outer'] = 'v', -- charwise
            --     ['@function.outer'] = 'V', -- linewise
            --     ['@class.outer'] = '<c-v>' -- blockwise
            -- },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true
        }
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
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
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_username = { "javascript", "typescript.tsx" }
