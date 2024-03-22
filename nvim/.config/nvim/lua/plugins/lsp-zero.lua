return {
    'VonHeikemen/lsp-zero.nvim',
    config = function()
        local lsp_zero = require('lsp-zero')
        local lsp_configs = require('lspconfig.configs')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false, noremap = true, silent = true }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_command [[augroup Format]]
                vim.api.nvim_command [[autocmd! * <buffer>]]
                vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
                vim.api.nvim_command [[augroup END]]
            end
        end)

        lsp_zero.set_sign_icons({
            error = " ",
            warn = " ",
            hint = " ",
            info = " "
        })

        local config = {
            handlers = {
                ["textDocument/definition"] = require('csharpls_extended').handler,
                ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
            },
        }

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'phpactor', 'intelephense', 'vuels', 'tsserver', 'html', 'cssls', 'emmet_ls', 'csharp_ls', 'tailwindcss', 'marksman', 'jsonls', 'eslint' },
            handlers = {
                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT'
                                },
                                diagnostics = {
                                    globals = { 'vim' }
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true)
                                },
                                telemetry = { enable = false }
                            }
                        }
                    })
                end,
                intelephense = function()
                    require('lspconfig').intelephense.setup({
                        cmd = { "intelephense", "--stdio" },
                        filetypes = { "php", "blade" },
                        settings = {
                            intelephense = {
                                telemetry = { enabled = false },
                                completion = { fullyQualifyGlobalConstantsAndFunctions = false },
                                phpdoc = { returnVoid = false },
                                files = {
                                    associations = { "*.php", "*.blade.php" },
                                    maxSize = 5000000,
                                }
                            }
                        }
                    })
                end,
                phpactor = function()
                    require('lspconfig').phpactor.setup({})
                end,
                jsonls = function()
                    require('lspconfig').jsonls.setup({})
                end,
                eslint = function()
                    require('lspconfig').eslint.setup({
                        cmd = { "vscode-eslint-language-server", "--stdio" },
                        on_attach = function(client, bufnr)
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                command = "EslintFixAll",
                            })
                        end,
                    })
                end,
                csharp_ls = function()
                    require 'lspconfig'.csharp_ls.setup(config)
                end,
                marksman = function()
                    require('lspconfig').marksman.setup({})
                end,
                texlab = function()
                    require('lspconfig').texlab.setup({})
                end,
                emmet_ls = function()
                    require('lspconfig').emmet_ls.setup({
                        filetypes = {
                            'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss',
                            'less', 'blade', 'blade.php'
                        },
                    })
                end,
                vuels = function()
                    require('lspconfig').vuels.setup({
                        filetypes = { 'vue' }
                    })
                end,
            }
        })

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

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

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            sources = {
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                --{ name = 'vsnip' },
            },
            formatting = {
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind],
                        vim_item.kind)
                    return vim_item
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require('luasnip').expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true), '')
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
            }),
        })
    end
}
