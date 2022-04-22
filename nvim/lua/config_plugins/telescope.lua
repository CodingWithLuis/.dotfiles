local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<C-F>', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<C-G>', '<cmd>lua require("telescope.builtin").git_files()<CR>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map('n', '<leader>ob', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map('n', '<leader>ht', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)

--Tressiter
map('n', '<leader>ts', '<cmd>lua require("telescope.builtin").treesitter()<CR>', opts)


--Git
map('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<CR>', opts)
map('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<CR>', opts)
map('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<CR>', opts)

--flutter
map('n', '<leader>fc', '<cmd>lua require("telescope").extensions.flutter.commands()<CR>', opts)


map('n', '<leader>la', '<cmd>lua require("config_plugins.telescope_custom").laravel_artisan()<CR>', opts)
map('n', '<leader>lp', '<cmd>lua require("config_plugins.telescope_custom").project_find()<CR>', opts)
