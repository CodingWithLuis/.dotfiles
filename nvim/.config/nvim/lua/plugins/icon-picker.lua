return {
    { "stevearc/dressing.nvim" },
    {
        "ziontee113/icon-picker.nvim",
        opts = {
            disable_legacy_commands = true
        },
        keys = {
            { "<leader><leader>i", "<cmd>IconPickerNormal<cr>", mode = "n", desc = "Icon Picker Normal" },
            { "<leader><leader>y", "<cmd>IconPickerYank<cr>",   mode = "n", desc = "Icon Picker Yank" },
            { "<leader>i",         "<cmd>IconPickerInsert<cr>", mode = "i", desc = "Icon Picker Insert" }
        }
    }
}
