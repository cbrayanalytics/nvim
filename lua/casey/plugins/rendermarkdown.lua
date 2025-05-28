return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	config = function()
		require("render-markdown").setup({

			heading = {
				border = true,
				border_virtual = true,
				icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
				sign = true,
				signs = { " " },
			},
			dash = {
				icon = "",
			},
			bullet = {
				icons = { "󰳳", "󰳳" },
				ordered_icons = function(ctx)
					local value = vim.trim(ctx.value)
					local index = tonumber(value:sub(1, #value - 1))
					return ("%d."):format(index > 1 and index or ctx.index)
				end,
				left_pad = 0.5,
				right_pad = 1,
				highlight = "RenderMarkdownBullet",
				scope_highlight = {},
			},
			checkbox = {
				enabled = true,
				render_modes = false,
				right_pad = 1,
				unchecked = {
					icon = "✘",
					highlight = "RenderMarkdownUnchecked",
					scope_highlight = nil,
				},
				checked = {
					icon = "✔",
					highlight = "RenderMarkdownChecked",
					scope_highlight = "@markup.strikethrough",
				},
				custom = {
					todo = {
						raw = "[-]",
						rendered = "󰥕",
						highlight = "RenderMarkdownTodo",
						scope_highlight = nil,
					},
				},
			},
		})
	end,
}
