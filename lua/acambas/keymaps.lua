vim.g.mapleader = " "
vim.g.maplocalleader = " "

local noremap_silent = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "open explorer" })
vim.keymap.set("n", "<C-a>", "gg<s-V>G", noremap_silent) -- select all
vim.keymap.set({ "i", "n" }, "<C-s>", "<Esc>:silent w!<CR>", noremap_silent) -- save file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selection up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selection up
vim.keymap.set("n", "J", "12jzz")
vim.keymap.set("n", "K", "12kzz")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "S", "<nop>")
vim.keymap.set({ "n", "v" }, "c", '"xc')
vim.keymap.set("n", "<leader>gq", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd("botright " .. action)
end, { desc = "toggle quicklist", noremap = true, silent = true })
-- use `u` to undo, use `U` to redo
vim.keymap.set("n", "U", "<C-r>", { remap = false })

-- Make search results appear in the middle of the screen
vim.keymap.set("n", "n", "nzz", { remap = false })
vim.keymap.set("n", "N", "Nzz", { remap = false })
vim.keymap.set("n", "*", "*zz", { remap = false })

-- Copy current file name (relative/absolute) to system clipboard
vim.keymap.set(
	"n",
	"<leader>fcr",
	[[ :let @*=expand("%")<CR> ]],
	{ remap = false, silent = true, desc = "copy relative path" }
)
vim.keymap.set(
	"n",
	"<leader>fca",
	[[ :let @*=expand("%:p")<CR> ]],
	{ remap = false, silent = true, desc = "copy absolute path" }
)
vim.keymap.set(
	"n",
	"<leader>fcf",
	[[ :let @*=expand("%:t")<CR> ]],
	{ remap = false, silent = true, desc = "copy file name" }
)
vim.keymap.set(
	"n",
	"<leader>fcF",
	[[ :let @*=expand("%:h")<CR> ]],
	{ remap = false, silent = true, desc = "copy relative folder path" }
)

if vim.g.vscode then
	-- VSCode extension
	vim.keymap.set("n", "s", "<nop>")
	vim.keymap.set("n", "Q", "<nop>")
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>")
	vim.keymap.set("n", "<leader>sf", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
	vim.keymap.set("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
	vim.keymap.set("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
else
	-- vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTerm<CR>")
	-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

	-- ordinary Neovim
	vim.keymap.set("n", "Q", "<Esc>:qa!<CR>", { silent = true })
	-- buffer stuff
	vim.keymap.set("n", "<tab>", "<C-S-^>")
	-- vim.keymap.set("n", "<C-q>", "<Esc>:bw!<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
	vim.keymap.set("n", "<leader>bn", "<Esc>:bnext<cr>", { desc = "buffer [n]ext", silent = true, noremap = true })
	vim.keymap.set("n", "<leader>bp", "<Esc>:bprev<cr>", { desc = "buffer [p]revious", silent = true, noremap = true })
	vim.keymap.set("n", "<leader>bq", "<Esc>:bw!<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
	-- editor.action.quickFix
	-- Resize windows with arrow keys
	vim.keymap.set({ "n", "t" }, "<m-Left>", "<C-w><", { remap = false })
	vim.keymap.set({ "n", "t" }, "<m-Right>", "<C-w>>", { remap = false })
	vim.keymap.set({ "n", "t" }, "<m-Up>", "<C-w>-", { remap = false })
	vim.keymap.set({ "n", "t" }, "<m-Down>", "<C-w>+", { remap = false })
end
