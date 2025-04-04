local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()


-- Python LSP setup
lspconfig.pyright.setup{
    capabilities = capabilities,
}

-- Typescript LSP setup
lspconfig.ts_ls.setup{
    capabilities = capabilities,
}

-- Svelte LSP setup
lspconfig.svelte.setup{
    capabilities = capabilities,
}

-- HTML LSP setup
lspconfig.html.setup{
    capabilities = capabilities,
}

-- CSS LSP setup
lspconfig.cssls.setup{
    capabilities = capabilities,
}



vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
