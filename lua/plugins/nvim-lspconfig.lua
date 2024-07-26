return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

		local lsp = require("lspconfig")

		lsp.lua_ls.setup {}
		lsp.rust_analyzer.setup {}
		lsp.gopls.setup {}
		lsp.tflint.setup {}
		lsp.yamlls.setup {}
		lsp.autotools_ls.setup {}
	end

}
