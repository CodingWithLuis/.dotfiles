local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup("plugins")
require("mappings.general")
require("mappings.fugitive")

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

vim.filetype.add({
    pattern = {
        ['.*%.blade%.php'] = 'blade',
    }
})
