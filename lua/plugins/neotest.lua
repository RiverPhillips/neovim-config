return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
	},
	config = function()
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message =
					    diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub(
					    "^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		require("neotest").setup({
			adapters = {
				require("neotest-go")({
					args = { "-race", "-timeout=30s" }
				}),
				require("neotest-rust"),
			},
		})
	end
}
