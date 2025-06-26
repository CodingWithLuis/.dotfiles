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
-- vim.g.papyrus_viewer = 'okular'
vim.g.papyrus_latex_engine = 'pdflatex'

vim.lsp.enable('luals')
vim.lsp.enable('marksman')

local intelephense_config = require('lsp.intelephense')
vim.lsp.config.intelephense = intelephense_config
vim.lsp.enable('intelephense')

vim.lsp.enable('phpactor')
vim.lsp.enable('jsonls')
vim.lsp.enable('texlab')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('ts_ls')
vim.lsp.enable('vue_ls')

local emmet_config = require('lsp.emmetls')
vim.lsp.config.emmet_ls = emmet_config
vim.lsp.enable('emmet_ls')

vim.lsp.enable('csharp_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('laravel_ls')

require("lazy").setup("plugins")
require("mappings.general")
require("mappings.fugitive")
require("mappings.oil")
require("mappings.harpoon")
require("config.treesiter-parsers")
require("config.dap-adapters")
require("config.telescope")

vim.g.gruvbox_baby_transparent_mode = 1
vim.g.use_original_palette = true
vim.cmd [[colorscheme gruvbox-baby]]

-- local ft = require('Comment.ft')
-- ft.set('blade', { '{{--%s--}}', '{{--%s--}}' })
