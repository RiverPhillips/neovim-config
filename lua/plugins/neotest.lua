return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
		"mrcjkb/rustaceanvim"
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
					args = { "-race", "-timeout=60s", }
				}),
				require('rustaceanvim.neotest')
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
				neotest.run.run(vim.fn.expand("%"))
				neotest.summary.open()
			end,
			{ nargs = 0 }
		)
		vim.api.nvim_create_user_command(
			"TestWatch",
			function(args)
				neotest.watch()
				neotest.summary.open()
			end,
			{ nargs = 0 }
		)
	end
}
