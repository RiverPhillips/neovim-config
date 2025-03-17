vim.api.nvim_set_hl(0, "SolarizedLightCurrentGroup", {
	fg = "#586E75", -- Solarized Base01 (dark cyan)
	bg = "#FDF6E3", -- Solarized Base3 (light background)
	bold = true
})

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
	opts = {
		-- add any opts here
		provider = "copilot",
		auto_suggestions_provider = "copilot",
		highlights = {
			diff = {
				current = "SolarizedLightCurrentGroup",
			}
		},

	},
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"stevearc/dressing.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"zbirenbaum/copilot.lua",
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
	},
	enabled = true
}
