return {
    {
        "vhyrro/luarocks.nvim",
        config = function()
            require("luarocks").setup({})
        end,
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup({
                keybinds = {
                    {
                        "<leader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
                    },
                    {
                        "<leader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
                    },
                },

            })
        end,
    }
}
