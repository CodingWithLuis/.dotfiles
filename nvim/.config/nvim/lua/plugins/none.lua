return {
    'nvimtools/none-ls.nvim',
    config = function()
        local lsp = require('lsp-zero')
        local null_ls = require('null-ls')
        null_opts = lsp.build_options('null-ls', {})

        null_ls.setup({
            on_attach = function(client, bufnr)
                null_opts.on_attach(client, bufnr)

                if client.server_capabilities.documentFormattingProvider then
                    vim.cmd(
                        "nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({async = true, timeout_ms = 10000})<CR>")
                    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format({async = true, timeout_ms = 10000})")
                end

                if client.server_capabilities.documentRangeFormattingProvider then
                    vim.cmd(
                        "xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({async= true, timeout_ms = 10000})<CR>")
                end
            end,
            sources = {
                null_ls.builtins.code_actions.eslint_d,
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.eslint_d,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.diagnostics.proselint,
                null_ls.builtins.formatting.lua_format,
                null_ls.builtins.formatting.dart_format,
                null_ls.builtins.formatting.csharpier
            }
        })
    end
}
