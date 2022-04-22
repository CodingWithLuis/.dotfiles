require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"vue"},
    additional_vim_regex_hightlight = true,
  },
  indent = {
    enable = false,
    disable = {},
  },
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "php",
    "json",
    "yaml",
    "html",
    "css",
    "vue",
    "typescript",
    "lua"
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
  refactor = {
    highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
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
      show_help = '?',
    },
  }
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_username = { "javascript", "typescript.tsx" } 
