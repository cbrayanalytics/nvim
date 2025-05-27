return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		options = {
			separator_style = "slant", -- enables slanted tab separators
			diagnostics = "nvim_lsp", -- enables LSP diagnostic indicators
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = (level == "error" and " ")
					or (level == "warning" and " ")
					or (level == "info" and " ")
					or ""
				return icon .. count
			end,
			show_buffer_close_icons = true,
			show_close_icon = false,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
				},
			},
		},
	},
}
