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
vim.opt.termguicolors = true

require("lazy").setup("plugins")
require("mappings.general")
require("mappings.fugitive")
require("mappings.oil")
require("mappings.harpoon")
require("mappings.refactoring")
require("config.treesiter-parsers")

vim.g.gruvbox_baby_transparent_mode = 1
vim.g.use_original_palette = true
vim.cmd [[colorscheme gruvbox-baby]]
