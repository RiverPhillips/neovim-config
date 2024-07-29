return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require('dap'), require('dapui')
		dap.adapters.delve = {
			type = 'server',
			port = '${port}',
			executable = {
				command = 'dlv',
				args = { 'dap', '-l', '127.0.0.1:${port}' },
				-- add this if on windows, otherwise server won't open successfully
				-- detached = false
			}
		}

		-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}"
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}"
			},
			-- works with go.mod packages and sub packages
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}"
			}
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("x", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
		vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")

		vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>")
		vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<CR>")
		vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<CR>")
	end
}
