return {
    'jiaoshijie/undotree',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = true,
    keys = {
        { '<leader>u',  "<cmd>lua require('undotree').toggle()<cr>" },
        { '<leader>uo', "<cmd>lua require('undotree').open<cr>" },
        { '<leader>uc', "<cmd>lua require('undotree').close<cr>" }
    }
}
