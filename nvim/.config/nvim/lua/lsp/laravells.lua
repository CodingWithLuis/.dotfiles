return {
    cmd = { '/home/envy/go/bin/laravel-ls' },
    filetypes = { 'php', 'blade' },
    root_markers = { 'composer.json', 'artisan' },
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end
}
