-- plugins/rest.lua
return {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
        { ';rr', ":lua require('rest-nvim').run()<CR>",    desc = "Run Rest Nvim" },

        { ';rl', ":lua require('rest-nvim').last()<CR>",   desc = "Run Last Rest" },

        { ';rp', ":lua require('rest-nvim').run(true)<CR>" },
    }
}
