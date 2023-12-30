local kmap = vim.keymap.set

kmap({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end)

kmap({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end)

kmap({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end)

kmap({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end)
