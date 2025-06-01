return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"dockerfile",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"sql",
				"terraform",
				"yaml",
				"gomod",
				"gosum",
				"gotmpl",
				"goctl",
				"go",
				"gowork",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
		-- Set up autotag separately!
		require("nvim-ts-autotag").setup()
	end,
}
