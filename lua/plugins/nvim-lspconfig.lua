return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

		require("lspconfig").lua_ls.setup {}
		require("lspconfig").rust_analyzer.setup {}
		require("lspconfig").go_pls.setup {}
		require("lspconfig").tflint.setup {}
		require("lspconfig").yamlls.setup {}
	end

}
