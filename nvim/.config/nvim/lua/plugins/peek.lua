return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    keys = {
        { "<leader>pp", "<CMD>lua require('peek').open()<CR>",  desc = "Markdown Preview" },
        { "<leader>pc", "<CMD>lua require('peek').close()<CR>", desc = "Markdown Preview Stop" },
    },
    opts = {
        app = 'browser'
    }
}
