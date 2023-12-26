-- local trouble = require("trouble.providers.telescope")
local fb_actions = require"telescope".extensions.file_browser.actions

local telescope = require("telescope")

local function telescope_buffer_dir() return vim.fn.expand('%:p:h') end

telescope.setup {
    -- defaults = {
    --     mappings = {
    --         i = { ["<c-t>"] = trouble.open_with_trouble },
    --         n = { ["<c-t>"] = trouble.open_with_trouble }
    --     },
    --     preview = { treesitter = true }
    -- },
    extensions = {
        -- ["laravel-docs"] = {
        --   version = "9.x", -- one of: "6.x", "7.x", "8.x", "9.x", "master"
        --   preview = true, -- show telescope preview
        --    preview_with_glow = true, -- use glow as telescope previewer
        --    directory = "$HOME/.cache/laravel-docs" -- where to clone the laravel docs github repo
        -- },
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            initial_mode = "normal",
            hidden = true,
            grouped = true,
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            mappings = {
                ["i"] = {
                    ["<C-n>"] = fb_actions.create,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-y>"] = fb_actions.copy,
                    ["M"] = fb_actions.move,
                    ["<C-k>"] = function()
                        vim.cmd('normal vbd')
                    end
                },
                ["n"] = {
                    ['/'] = function() vim.cmd('startinsert') end,
                    ["n"] = fb_actions.create,
                    ["r"] = fb_actions.rename,
                    ["d"] = fb_actions.remove,
                    ["y"] = fb_actions.copy,
                    ["m"] = fb_actions.move
                }
            }
        },
        ["ui-select"] = {require("telescope.themes").get_dropdown {}}
    }
}

require("telescope").load_extension "file_browser"
-- require("telescope").load_extension "laravel-docs"
require("telescope").load_extension("ui-select")

local map = vim.keymap

map.set("n", "<space>fb",
        function() telescope.extensions.file_browser.file_browser({}) end,
        {silent = true, noremap = true})

-- map.set("n", "<Leader>ld", "<Cmd>Telescope laravel-docs<CR>")

-- local opts = {noremap.set = true, silent = true}
local builtin = require("telescope.builtin")

map.set('n', '<C-F>', builtin.find_files, {})
map.set('n', '<C-G>', builtin.git_files, {})
map.set('n', '<leader>fg', builtin.live_grep, {})
map.set('n', '<leader>ob', builtin.buffers, {})
map.set('n', '<leader>ht', builtin.help_tags, {})
map.set('n', 'tk', builtin.keymaps, {})
map.set('n', '<leader>ps',
        function() builtin.grep_string({search = vim.fn.input("Grep > ")}) end,
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
map.set('n', '<leader>;;', '<cmd>Telescope tmux sessions<cr>', {silent = true})
map.set('n', 'cw', '<cmd>Telescope tmux windows<cr>', {silent = true})
