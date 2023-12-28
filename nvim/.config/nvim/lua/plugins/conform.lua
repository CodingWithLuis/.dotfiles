return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            blade = { "blade-formatter" },
        },
        format_on_save = {
            timeout_ms = 3000,
            lsp_fallback = true,
        }
    }
}
