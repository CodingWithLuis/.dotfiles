local dap = require('dap')

dap.adapters.php = {
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
            -- ["$HOME/code/"] = "${workspaceFolder}",
            ["/home/vagrant/code/demo"] = "$HOME/code/demo"
        },
    },
}
