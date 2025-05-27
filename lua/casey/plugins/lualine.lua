return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local lazy_status = require("lazy.status")
		return {
			options = {
				theme = "auto", -- Auto-detect theme
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{ "encoding" },
					{ "fileformat" },
				},
				lualine_y = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return "No LSP"
							end
							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return " " .. table.concat(names, ", ")
						end,
						color = { gui = "bold" },
					},
				},
				lualine_z = {
					{ "location" },
					{
						function()
							return os.date("%y/%m/%d %H:%M")
						end,
					},
				},
			},
		}
	end,
}
