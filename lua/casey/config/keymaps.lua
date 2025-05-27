-- set leader key to space
vim.g.mapleader = " "

local km = vim.keymap -- for conciseness

---------- generals ----------

-- use jk to exit insert mode --
km.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights --
km.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers --
km.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Window Management --
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
km.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Vim Maximizer (split windows) --
km.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- Tab Management --
km.set("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
km.set("n", "<leader><tab>x", "<cmd>bdelete<CR>", { desc = "Close current tab" }) -- close current tab
km.set("n", "<leader><tab>n", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
km.set("n", "<leader><tab>p", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
km.set("n", "<leader><tab>f", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Nvim Tree --
km.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
km.set("n", "<leader>ef", "<cmd>Nvim<cr>TreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
km.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
km.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Telescope Keybindings --
km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
km.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" })
km.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- Obsidian Keybindings --
km.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create new obsidian note" })
km.set("n", "<leader>od", "<cmd>ObsidianToday<cr>", { desc = "Create new obsidian daily note(today)" })
km.set("n", "<leader>ot", "<cmd>ObsidianTomorrow<cr>", { desc = "Create new obsidian daily note(tomorrow)" })
