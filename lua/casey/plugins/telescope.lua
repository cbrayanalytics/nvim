return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	opts = {
		defaults = {
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-k>"] = "move_selection_previous", -- move to prev result
					["<C-j>"] = "move_selection_next", -- move to next result
					["<C-t>"] = "select_tab", -- select result in new tab
					["<C-h>"] = "which_key", -- view keymappings
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("todo-comments")
		vim.keymap.set("n", "<leader><tab>t", "<cmd>TodoTelescope<cr>", { desc = "Find TODOs (Telescope)" })
	end,
}
