return {
	"nvim-tree/nvim-tree.lua",
	lazy = false, -- load on startup
	opts = {
		view = {
			width = 35,
			relativenumber = true,
		},
		renderer = {
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "", -- arrow when folder is closed
						arrow_open = "", -- arrow when folder is open
					},
				},
			},
		},
		actions = {
			open_file = {
				window_picker = {
					enable = false, -- better splits experience
				},
			},
		},
		filters = {
			custom = { ".DS_Store" }, -- hide macOS metadata files
		},
		git = {
			ignore = false, -- show all git files, even ignored ones
		},
	},
}
