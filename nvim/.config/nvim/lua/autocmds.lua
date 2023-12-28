local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = "*.blade.php",
    callback = function()
        vim.bo.filetype = "php"
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.blade.php",
    callback = function(args)
        vim.schedule(function()
            for _, client in ipairs(vim.lsp.get_active_clients()) do
                if client.name == "intelephense" and client.attached_buffers[args.buf] then
                    vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
                    break
                end
            end
        end)
    end,
})
