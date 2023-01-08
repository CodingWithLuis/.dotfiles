local map = vim.keymap
-- local opts = {noremap.set = true, silent = true}
local builtin = require("telescope.builtin")

map.set('n', '<C-F>', builtin.find_files, {})
map.set('n', '<C-G>', builtin.git_files, {})
map.set('n', '<leader>fg', builtin.live_grep, {})
map.set('n', '<leader>ob', builtin.buffers, {})
map.set('n', '<leader>ht', builtin.help_tags, {})
map.set('n', '<leader>ps',
    function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
    {})

-- Tressiter
map.set('n', '<leader>ts', builtin.treesitter, {})

-- Git
map.set('n', '<leader>gc', builtin.git_commits, {})
map.set('n', '<leader>gb', builtin.git_branches, {})
map.set('n', '<leader>gs', builtin.git_status, {})

map.set('n', '<leader>dd', function()
    builtin.git_files({
        prompt_title = "Dotfiles",
        cwd = "$HOME/.dotfiles",
        show_untracked = true
    })
end)

-- flutter
map.set('n', '<leader>fc', require("telescope").extensions.flutter.commands, {})

map.set('n', '<leader>la',
    require("config_plugins.telescope_custom").laravel_artisan, {})
map.set('n', '<leader>lp',
    require("config_plugins.telescope_custom").project_find, {})

-- Sessions
map.set('n', '<leader>ls', '<cmd>SessionManager load_session<cr>', {})
map.set('n', '<leader>ds', '<cmd>SessionManager delete_session<cr>', {})
map.set('n', '<leader>ll', '<cmd>SessionManager load_last_session<cr>', {})
