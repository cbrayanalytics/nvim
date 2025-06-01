return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		return {
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "shfmt", "prettier" },
				python = { "isort", "black" },
				go = { "goimports", "gofumpt", "golines" },
			},
			-- Use conform's built-in format-on-save
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		}
	end,
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
