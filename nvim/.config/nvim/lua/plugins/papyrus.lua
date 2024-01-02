return {
    'abeleinin/papyrus',
    keys = {
        { "<leader>pcp", "<CMD>PapyrusCompile pdf<CR>", desc = "Compile to PDF" }
    },
    ft = { 'tex', 'markdown' },
    config = function()
        vim.g.papyrus_latex_engine = 'pdflatex'
    end
}
