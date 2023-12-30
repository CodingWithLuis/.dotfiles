local dap = require('dap')

dap.adapters = {
    type = "executable",
    command = "php-debug-adapter"
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Laravel",
        port = 9003,
        pathMappings = {
            ["$HOME/code/"] = "${workspaceFolder}",
        },
    },
}
