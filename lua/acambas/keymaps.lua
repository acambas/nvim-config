vim.g.mapleader = " "
vim.g.maplocalleader = " "

local noremap_silent = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "open explorer" })
vim.keymap.set({ "i", "n" }, "<C-s>", "<Esc>:silent w!<CR>", noremap_silent)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "12jzz")
vim.keymap.set("n", "K", "12kzz")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "q", "<nop>")
-- vim.keymap.set("n", "s", "<nop>")
vim.keymap.set("n", "S", "<nop>")
vim.keymap.set("n", "<leader>gq", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd("botright " .. action)
end, { desc = "toggle quicklist", noremap = true, silent = true })

if vim.g.vscode then
	-- VSCode extension
	vim.keymap.set("n", "s", "<nop>")
	vim.keymap.set("n", "Q", "<nop>")
	vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc><Cmd>call VSCodeNotify('workbench.action.files.save')<CR>")
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>")
	vim.keymap.set("n", "<leader>sf", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
	vim.keymap.set("n", "<leader>", "<Cmd>call VSCodeNotify('whichkey.show')<CR>")
	vim.keymap.set("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
	vim.keymap.set("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
else
	-- ordinary Neovim
	vim.keymap.set("n", "Q", "<Esc>:qa!<CR>", { silent = true })
	-- buffer stuff
	vim.keymap.set("n", "<C-q>", "<Esc>:bw<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
	vim.keymap.set("n", "<leader>bn", "<Esc>:bnext<cr>", { desc = "buffer [n]ext", silent = true, noremap = true })
	vim.keymap.set("n", "<leader>bp", "<Esc>:bprev<cr>", { desc = "buffer [p]revious", silent = true, noremap = true })
	vim.keymap.set("n", "<leader>bq", "<Esc>:bw<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
	-- editor.action.quickFix
end
