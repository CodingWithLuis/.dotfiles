return {
    'ccaglak/namespace.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>GC", "<cmd>GetClasses<cr>" },
        { "<leader>Gc", "<cmd>GetClass<cr>" },
        { "<leader>ac", "<cmd>AsClass<cr>" },
        { "<leader>nm", "<cmd>Namespace<cr>" },
    }
}
