return {
    'mfussenegger/nvim-dap',
    keys = {
        { '<F4>',       function() require('dap').continue() end,                                                   desc = "Continue Debug" },
        { '<F10>',      function() require('dap').step_over() end },
        { '<F11>',      function() require('dap').step_into() end },
        { '<F12>',      function() require('dap').step_out() end },
        { '<Leader>b',  function() require('dap').toggle_breakpoint() end },
        { '<Leader>B',  function() require('dap').set_breakpoint() end },
        { '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
        { '<Leader>dr', function() require('dap').repl.open() end },
        { '<Leader>dl', function() require('dap').run_last() end },
    },
    config = function()
        vim.fn.sign_define('DapBreakpoint', { text = "🛑", texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = "", texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })
    end,
    opts = {},
}
