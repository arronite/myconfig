vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 80 -- Automatically break lines at 80 characters

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
vim.opt.clipboard = "unnamed" -- Use system clipboard

-- Mouse settings
vim.opt.mouse = "a" -- Enable mouse support

vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.breakindent = true -- Indent wrapped lines for better readability-- Soft wrap configuration
vim.o.wrap = true -- Enable soft wrapping
vim.o.linebreak = true -- Ensure wrapping happens at word boundaries
-- Hard wrap configuration
vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })

vim.diagnostic.config({
	virtual_text = true, -- Disable inline virtual text
	signs = true, -- Enable signs in the gutter
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
