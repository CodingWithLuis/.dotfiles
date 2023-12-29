local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>hp", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>su", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>si", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>so", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>sp", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S>p", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S>n", function() harpoon:list():next() end)
