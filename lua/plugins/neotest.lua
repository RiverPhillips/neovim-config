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
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-go")({
					args = { "-race", "-timeout=30s" }
				}),
				require("neotest-rust"),
			},
		})

		vim.api.nvim_create_user_command(
			"TestSummary",
			function(args)
				neotest.summary.toggle()
			end,
			{ nargs = 0 }
		)

		vim.api.nvim_create_user_command(
			"TestRun",
			function(args)
				neotest.run.run()
			end,
			{ nargs = 0 }
		)
	end
}
