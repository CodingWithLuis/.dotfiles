local vue_language_server_path = vim.fn.stdpath('data') ..
    '/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
    enableForWorkspaceTypeScriptVersions = true,
}

return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'vue'
    },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
            autoUseWorkspaceTsdk = true,
        },
        typescript = {
            updateImportsOnFileMove = { enabled = 'always' },
            inlayHints = {
                parameterNames = { enabled = 'literals' },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
            },
        },
    },
}
