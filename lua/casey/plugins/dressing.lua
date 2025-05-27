return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true }, -- manage big files
		dashboard = { enabled = false }, -- already using dashboard with a different config
		explorer = { enabled = false }, -- using treesitter and nvim-tree
		indent = { enabled = true },
		input = { enabled = true }, -- < what we really want :)
		picker = { enabled = false }, -- also using neo-tree for this
		notifier = { enabled = true }, -- utility functions for `vim.notify`
		quickfile = { enabled = true }, -- render file faster when opening directly from cli
		scope = { enabled = true }, -- scope detection when jumping from objects
		scroll = { enabled = true }, -- smooth scrolling
		statuscolumn = { enabled = true }, -- pretty status column!
		words = { enabled = true }, -- auto show lsp references
		terminal = { enabled = true }, -- toggle/enable floating terminals
	},
}
