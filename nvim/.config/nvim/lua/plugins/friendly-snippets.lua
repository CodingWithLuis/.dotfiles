return {
    {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require 'luasnip'.filetype_extend("php", { "blade" })
        end,
    },
    { 'onecentlin/laravel-blade-snippets-vscode' },
    { 'onecentlin/laravel5-snippets-vscode' },
}
