return {
    'stevearc/oil.nvim',
    opts = {
    },
    config = function()
        require('oil').setup({})
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
