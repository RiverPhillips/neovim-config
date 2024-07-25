return {
	"hrsh7th/cmp-nvim-lsp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			 mapping = cmp.mapping.preset.insert({
      				["<C-b>"] = cmp.mapping.scroll_docs(-4),
      				["<C-f>"] = cmp.mapping.scroll_docs(4),
      				["<C-Space>"] = cmp.mapping.complete(),
      				["<C-e>"] = cmp.mapping.abort(),
      				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    			}),
			sources = cmp.config.sources({
      						{ name = "nvim_lsp" },
      						{ name = "vsnip" }, -- For vsnip users.
    					}, {
      						{ name = "buffer" },
    					}),
			})
	end
}

