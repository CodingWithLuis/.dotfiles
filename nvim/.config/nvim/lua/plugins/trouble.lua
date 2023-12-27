return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>xx",
            function() require('trouble').toggle() end,
            desc = "Toggle Trouble",
        },
        {
            "<leader>xw",
            function()
                require("trouble").toggle("workspace_diagnostics")
            end,
            desc = "Workspace Trouble"
        },
        {
            "<leader>xq",
            function()
                require('trouble').toggle('quickfix')
            end,
            desc = "Trouble Quickfix"
        }
    },
    opts = {
    },
}
