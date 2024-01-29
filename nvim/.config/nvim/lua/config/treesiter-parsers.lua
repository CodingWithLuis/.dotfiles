local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.php = {
    install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-php",
        files = { "src/parser.c" },
        branch = "master",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    },
    filetype = "php",
}
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
parser_config.markdown = {
    install_info = {
        url = 'https://github.com/MDeiml/tree-sitter-markdown',
        branch = 'split_parser',
        files = { 'src/parser.c', 'src/scanner.cc' },
    },
    filetype = 'markdown'
}

vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    }
})
