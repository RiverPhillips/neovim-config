return {
	"tpope/vim-fugitive",
	config = function()
		-- Optional: Add any Fugitive-specific configurations here
		vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true })
	end,
}
