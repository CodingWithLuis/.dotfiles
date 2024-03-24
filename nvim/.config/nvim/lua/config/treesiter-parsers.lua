local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade"
}
parser_config.tex = {
    install_info = {
        url = "https://github.com/latex-lsp/tree-sitter-latex",
        files = { "src/parser.c" },
        branch = "master"
    },
    filetype = "tex"
}

vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    }
})
