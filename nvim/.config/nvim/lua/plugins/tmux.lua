return {
    "aserowy/tmux.nvim",
    config = function()
        return require("tmux").setup({
            copy_sync = { enable = false },
            navigation = { enable_default_keybindings = true },
            resize = { enable_default_keybindings = true }
        })
    end
}
