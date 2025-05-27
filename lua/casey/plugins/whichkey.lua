return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- You can add your configuration here, or leave empty for defaults
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
