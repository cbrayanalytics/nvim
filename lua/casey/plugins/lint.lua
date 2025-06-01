return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		local lint = require("lint")

		-- Configure linters per filetype
		lint.linters_by_ft = {
			python = { "pylint" },
			bash = { "shellcheck" },
			lua = { "luacheck" },
			go = { "golangcilint" },
		}

		-- Setup mason-nvim-lint to auto-install linters
		require("mason-nvim-lint").setup()

		-- Create autocommand group
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Set up autocommands
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Keymap to trigger linting
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
