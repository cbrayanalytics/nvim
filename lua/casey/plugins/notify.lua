return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "fade_in_slide_out",
			timeout = 3000,
			background_colour = "#1a1b26",
		})
		vim.notify = notify
	end,
}
