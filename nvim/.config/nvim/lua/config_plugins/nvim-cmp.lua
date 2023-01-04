local nvim_lsp = require('lspconfig')
local protocol = require 'vim.lsp.protocol'
local configs = require 'lspconfig/configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa',
        '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr',
        '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
        opts)
    buf_set_keymap('n', '<space>D',
        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
        opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>',
        opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
        opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
        opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>',
        opts)
    buf_set_keymap('n', '<space>f',
        '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)

    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
    end

    local on_action = vim.lsp.handlers["textDocument/codeAction"]
    vim.lsp.handlers["textDocument/codeAction"] =
    vim.lsp.with(on_action, { loclist = true })

    vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- This sets the spacing and the prefix, obviously.
        virtual_text = { spacing = 4, prefix = '' }
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

nvim_lsp.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "intelephense", "--stdio" },
    settings = {
        intelephense = {
            telemetry = { enabled = false },
            completion = { fullyQualifyGlobalConstantsAndFunctions = false },
            phpdoc = { returnVoid = false }
        }
    }
}

nvim_lsp.phpactor.setup {}

require("flutter-tools").setup { nvim_lps = { capabilities = capabilities } }

-- local null_ls = require("null-ls")
local prettier = require("prettier")

local status, null_ls = pcall(require, 'null-ls')

if (not status) then return end

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd(
                "nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({})<CR>")
            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format({})")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd(
                "xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({})<CR>")
        end
    end,
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.formatting.lua_format
    }
})

prettier.setup({
    bin = 'prettierd', -- or `prettierd`
    filetypes = {
        "css", "graphql", "html", "javascript", "javascriptreact", "json",
        "less", "markdown", "scss", "typescript", "typescriptreact", "yaml",
        "vue"
    },
    -- prettier format options (you can use config files too. ex: `.prettierrc`)
    arrow_parens = "always",
    bracket_spacing = true,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = true
})

-- Diagnostics
local dlsconfig = require 'diagnosticls-configs'

local phpcs = require 'diagnosticls-configs.linters.phpcs'
local phpstan = require 'diagnosticls-configs.linters.phpstan'
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier_linter =
require 'diagnosticls-configs.formatters.prettier_eslint'

dlsconfig.init { on_attach = on_attach }

dlsconfig.setup {
    ['php'] = { linter = phpstan, formatter = phpcs },
    ['vue'] = { linter = eslint, formatter = prettier_linter }

}
dlsconfig.init { default_config = true, formatting = true }

-- dlsconfig.setup()

nvim_lsp.vuels.setup { on_attach = on_attach, capabilities = capabilities }

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = {
        "typescript", "typescriptreact", "typescript.tsx", "javascript"
    }
}

nvim_lsp.html.setup { on_attach = on_attach, capabilities = capabilities }

nvim_lsp.cssls.setup { capabilities = capabilities }

nvim_lsp.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities }

nvim_lsp.emmet_ls.setup {
    capabilities = capabilities,
    filetypes = {
        'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss',
        'less', 'blade', 'blade.php'
    },
    init_options = { html = { options = { ["bem.enabled"] = true } } }
}

nvim_lsp.marksman.setup {}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect,noinsert'

-- luasnip setup
local luasnip = require 'luasnip'

local cmp_kinds = {
    Class = ' ',
    Color = ' ',
    Constant = 'ﲀ ',
    Constructor = ' ',
    Enum = '練',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = '',
    Folder = ' ',
    Function = ' ',
    Interface = 'ﰮ ',
    Keyword = ' ',
    Method = ' ',
    Module = ' ',
    Operator = '',
    Property = ' ',
    Reference = ' ',
    Snippet = ' ',
    Struct = ' ',
    Text = ' ',
    TypeParameter = ' ',
    Unit = '塞',
    Value = ' ',
    Variable = ' '
}

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
            -- vim.fn["vsnip#anonymous"](args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind],
                vim_item.kind)
            return vim_item
        end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                    '<Plug>luasnip-expand-or-jump', true, true,
                    true), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    },
    sources = {
        { name = 'nvim_lsp' }, { name = 'luasnip' }, { name = 'vsnip' },
        { name = 'path' }
    }

}
