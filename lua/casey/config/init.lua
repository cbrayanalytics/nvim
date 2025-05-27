require("casey.config.options")
require("casey.config.keymaps")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.conceallevel = 2
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
