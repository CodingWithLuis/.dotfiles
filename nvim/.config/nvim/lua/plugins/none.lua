return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require('null-ls')

        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.dart_format,
                null_ls.builtins.formatting.csharpier,
            }
        })
    end
}
