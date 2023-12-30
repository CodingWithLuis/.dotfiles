return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
        { "<leader>do", function() require('dapui').open() end },
        { "<leader>dc", function() require('dapui').close() end },
        { "<leader>dt", function() require('dapui').toggle() end },
    },
    opts = {}
}
