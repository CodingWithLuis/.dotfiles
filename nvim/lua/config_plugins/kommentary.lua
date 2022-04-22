vim.g.kommentary_create_default_mappings = false

vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})

--[[ require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
} ]]

--[[ require('kommentary.config').configure_language('typescriptreact', {
  single_line_comment_string = 'auto',
  multi_line_comment_strings = 'auto',
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end,
})

require('kommentary.config').configure_language('vue', {
  single_line_comment_string = 'auto',
  multi_line_comment_strings = 'auto',
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end,
})

require('kommentary.config').configure_language("blade", {
    single_line_comment_string = {"{--", "--}"},
    multi_line_comment_strings = {"{--", "--}"},
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
}) ]]

