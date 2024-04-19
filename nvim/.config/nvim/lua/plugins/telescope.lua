return
{
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            build = "make",
            enabled = vim.fn.executable("make") == 1,
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        }
    },
    keys = {
        {
            "<leader>,",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch Buffer",
        },
        { "<leader>ch", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
        -- find
        { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
        { "<C-F>",      "<cmd>Telescope find_files<cr>",                desc = "Find files" },
        -- git
        { "<C-G>",      "<cmd>Telescope git_files<cr>",                 desc = "Git files" },
        { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "status" },
        -- search
        { '<leader>s"', "<cmd>Telescope registers<cr>",                 desc = "Registers" },
        { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
        { "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
        { "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>",       desc = "Document diagnostics" },
        { "<leader>sD", "<cmd>Telescope diagnostics<cr>",               desc = "Workspace diagnostics" },
        { "<leader>ht", "<cmd>Telescope help_tags<cr>",                 desc = "Help Pages" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "Search Highlight Groups" },
        { "<leader>km", "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "Man Pages" },
        { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "Jump to Mark" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "Options" },
        { "<leader>sR", "<cmd>Telescope resume<cr>",                    desc = "Resume" },
        { "<leader>lg", "<cmd>Telescope live_grep<cr>",                 desc = "Grep search" },
        {
            "<leader>ts",
            function()
                require('telescope.builtin').treesitter()
            end,
            desc = "Telescope treesitter"
        },
        {
            '<leader>ps',
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Search on project"
        },
        {
            '<leader>dd',
            function()
                require('telescope.builtin').git_files({
                    prompt_title = "Dotfiles",
                    cwd = "$HOME/.dotfiles",
                    show_untracked = true
                })
            end,
            desc = "Dotfiles"
        },
        { '<leader>;;', '<cmd>Telescope tmux sessions<cr>', desc = 'Telescope tmux sessions' },
        { '<leader>cw', '<cmd>Telescope tmux windows<cr>',  desc = 'Telescope tmux windows' },
    },
    opts = function()
        local actions = require("telescope.actions")

        local open_with_trouble = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
        end
        local open_selected_with_trouble = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
        end

        return {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                get_selection_window = function()
                    local wins = vim.api.nvim_list_wins()
                    table.insert(wins, 1, vim.api.nvim_get_current_win())
                    for _, win in ipairs(wins) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.bo[buf].buftype == "" then
                            return win
                        end
                    end
                    return 0
                end,
                mappings = {
                    i = {
                        ["<leader>t"] = open_with_trouble,
                        ["<a-t>"] = open_selected_with_trouble,
                        ["<a-i>"] = find_files_no_ignore,
                        ["<a-h>"] = find_files_with_hidden,
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                        ["<C-f>"] = actions.preview_scrolling_down,
                        ["<C-b>"] = actions.preview_scrolling_up,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                }
            }
        }
    end,
}
