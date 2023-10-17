vim.g.mapleader = " "
vim.g.maplocalleader = " "

local noremap_silent = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "open explorer" })
vim.keymap.set({ "i", "n" }, "<C-s>", "<Esc>:w!<cr>", noremap_silent)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "J", "o<Esc>")
vim.keymap.set("n", "K", "O<Esc>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "s", "<nop>")
vim.keymap.set("n", "S", "<nop>")
vim.keymap.set("n", "Q", "<Esc>:qa!<CR>", { silent = true })
vim.keymap.set("n", "<leader>gq", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd("botright " .. action)
end, { desc = "toggle quicklist", noremap = true, silent = true })
-- buffer stuff
vim.keymap.set("n", "<C-q>", "<Esc>:bw<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bn", "<Esc>:bnext<cr>", { desc = "buffer [n]ext", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bp", "<Esc>:bprev<cr>", { desc = "buffer [p]revious", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bq", "<Esc>:bw<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
