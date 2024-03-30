return {
    "frabjous/knap",
    keys = {
        vim.keymap.set({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end),
        vim.keymap.set({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end),
        vim.keymap.set({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end),
        vim.keymap.set({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end)
    }
}
