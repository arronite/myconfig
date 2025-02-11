local opts = { noremap = true }
vim.api.nvim_set_keymap("i", "<C-s>", "<esc><cmd>w<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<cr>", opts)

vim.api.nvim_set_keymap("n", "<C-v>", "<cmd>visual block<cr>", opts)
--vim.keymap.set({ "i", "n" }, "/", "<cmd>Neotree toggle current reveal_force_cwd<cr>", opts)

vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

vim.keymap.set({ "n", "t" }, "<leader>bd", "<cmd>bnext | bdelete #<Cr>", opts)

vim.keymap.set("n", "<leader>|", "<C-w>v", opts)
vim.keymap.set("n", "<leader>-", "<C-w>s", opts)

vim.keymap.set({ "n", "t" }, "<C-Up>", "<cmd>resize +2<CR>", opts)
vim.keymap.set({ "n", "t" }, "<C-Down>", "<cmd>resize -2<CR>", opts)
vim.keymap.set({ "n", "t" }, "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set({ "n", "t" }, "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t1", "<cmd>ToggleTerm 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t2", "<cmd>ToggleTerm 2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ht", "<cmd>ToggleTerm 3 direction=horizontal<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

vim.keymap.set("i", "<A-i>", "<cmd>CccPick<cr><esc>", opts)

-- In terminal mode, use <Ctrl-w> for window navigation like in normal mode
vim.api.nvim_set_keymap("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>cppb",
	'<cmd>!cd build && cmake .. -G "MinGW Makefiles" && cmake --build .<CR>',
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
-- vim.keymap.set("n", "<F11>", function()
-- require("dap").step_into()
-- end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>tb", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
