return {
    'abeleinin/papyrus',
    keys = {
        { "<leader>pcp", "<CMD>PapyrusCompile pdf --template eisvogel --highlight-style tango --number-sections<CR>", desc = "Compile to PDF using eisvogel template" }
    },
    { "<leader>pv", "<CMD>PapyrusView<CR>", desc = "Papyrus PDF Viewer" },
    ft = { 'tex', 'markdown' },
}
