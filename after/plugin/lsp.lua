local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()


-- Python LSP setup
lspconfig.pyright.setup({
	on_new_config = function(new_config, root_dir)
		local pipfile_exists = require("lspconfig").util.search_ancestors(root_dir, function(path)
			local pipfile = require("lspconfig").util.path.join(path, "Pipfile")
			if require("lspconfig").util.path.is_file(pipfile) then
				return true
			else
				return false
			end
		end)

		if pipfile_exists then
			new_config.cmd = { "pipenv", "run", "pyright-langserver", "--stdio" }
		end
	end,
})

-- JavaScript LSP setup
lspconfig.tsserver.setup{}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
