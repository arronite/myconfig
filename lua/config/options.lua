vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
-- Tab settings
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.softtabstop = 4 -- Number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- Insert 4 spaces on a tab
vim.opt.expandtab = true -- Tabs are spaces, mainly because of Python

-- UI settings
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight the current line
vim.opt.splitbelow = true -- Open new vertical splits below
vim.opt.splitright = true -- Open new horizontal splits to the right
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI

-- Search settings
vim.opt.incsearch = true -- Search as characters are entered
vim.opt.hlsearch = false -- Do not highlight matches
vim.opt.ignorecase = true -- Ignore case in searches by default
vim.opt.smartcase = true -- Case-sensitive if uppercase is entered

-- Clipboard settings
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Mouse settings
vim.opt.mouse = "a" -- Enable mouse support
