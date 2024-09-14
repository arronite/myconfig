local opts = { noremap = true }
vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>w<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<cr>", opts)

--vim.keymap.set({ "i", "n" }, "/", "<cmd>Neotree toggle current reveal_force_cwd<cr>", opts)
vim.keymap.set("n", "<leader>e", "<cmd>Neotree  toggle <cr>", opts)
vim.keymap.set({ "i", "n" }, "gd", "<cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<cr>", opts)
vim.keymap.set({ "i", "n" }, "<leader>b", "<cmd>Neotree toggle show buffers right<cr>", opts)
vim.keymap.set({ "i", "n" }, "<leader>s", "<cmd>Neotree float git_status<cr>", opts)

vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

vim.keymap.set({ "n", "t" }, "<leader>bd", "<cmd>BufferLinePickClose<CR>", opts)

vim.keymap.set("n", "<leader>|", "<C-w>v", opts)
vim.keymap.set("n", "<leader>-", "<C-w>s", opts)

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})