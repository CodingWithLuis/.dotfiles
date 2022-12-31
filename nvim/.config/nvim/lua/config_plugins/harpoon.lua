local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local map = vim.keymap

map.set("n", "<Leader>ss", ui.toggle_quick_menu, { noremap = true, silent = true, expr = false })
map.set("n", "<Leader>sa", mark.add_file, { noremap = true, silent = true, expr = false })

map.set("n", "<Leader>su", function() ui.nav_file(1) end, { noremap = true, silent = true, expr = false })
map.set("n", "<Leader>si", function() ui.nav_file(2) end, { noremap = true, silent = true, expr = false })
map.set("n", "<Leader>so", function() ui.nav_file(3) end, { noremap = true, silent = true, expr = false })
map.set("n", "<Leader>sp", function() ui.nav_file(4) end, { noremap = true, silent = true, expr = false })
