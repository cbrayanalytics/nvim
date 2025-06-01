return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua", -- for floating window support (optional but recommended)
		"neovim/nvim-lspconfig", -- for LSP integration
		"nvim-treesitter/nvim-treesitter", -- syntax highlighting
	},
	config = function()
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
