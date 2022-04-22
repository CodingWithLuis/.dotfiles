-- Use <Tab> and <S-Tab> to navigate through popup menu
--inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vim.o.completeopt = "menuone,noinsert,noselect"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})


local remap = vim.api.nvim_set_keymap
local status, npairs = pcall(require, "nvim-autopairs")
if (not status) then return end

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      require'completion'.confirmCompletion()
      return npairs.esc("<c-y>")
    else
      vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
      require'completion'.confirmCompletion()
      return npairs.esc("<c-n><c-y>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

