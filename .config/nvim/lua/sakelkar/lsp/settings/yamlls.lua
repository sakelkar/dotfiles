return {
    on_attach=on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        yaml = {
            schemas = {
                kubernetes = "*.yaml"
            }
        }
    }
}
