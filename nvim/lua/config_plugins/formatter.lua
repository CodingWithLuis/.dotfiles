require('formatter').setup({
  filetype = {
    vue = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.vue FormatWrite
augroup END
]], true)
