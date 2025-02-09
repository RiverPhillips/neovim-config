return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		local masonlsp = require("mason-lspconfig")


		masonlsp.setup({
			ensure_installed = {
				"lua_ls",
				"gopls",
				"tflint",
				"yamlls",
				"golangci_lint_ls",
				"bashls",
				"terraformls"
			},
			handlers = { rust_analyzer = function() end }
		})

		masonlsp.setup_handlers {
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup {}
			end,
		}
	end
}
