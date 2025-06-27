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

local lua_config = require('lsp.luals')
vim.lsp.config.lua_ls = lua_config
vim.lsp.enable('lua_ls')

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

vim.filetype.add({
    pattern = { ['.*%.blade%.php'] = 'blade' }
})
local laravel_config = require('lsp.laravells')
vim.lsp.config.laravel_ls = laravel_config
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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    end,
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = "  "
        }
    }
})

-- local ft = require('Comment.ft')
-- ft.set('blade', { '{{--%s--}}', '{{--%s--}}' })
