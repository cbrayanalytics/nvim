local v = vim.g
local opt = vim.opt

-- line numbers --
opt.number = true
opt.relativenumber = true

-- UI --
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" 

-- Tabs --
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-- Tabs --
opt.wrap = false

-- Memory, CPU --
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event


-- Cursor line --
opt.cursorline = true

-- Backspace --
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Clipboard --
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split Windows --
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Turn off Swapfile --
opt.swapfile = false



