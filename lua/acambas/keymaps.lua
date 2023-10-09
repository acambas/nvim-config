vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local noremap_silent = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "open explorer" })
vim.keymap.set("n", "<C-s>", '<cmd>write<cr>', {
  desc = 'N: Save current file by <command-s>',
})
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>", noremap_silent)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "J", "o<Esc>k")

vim.keymap.set("n", "K", "O<Esc>j")

vim.keymap.set("n", "<C-Q>", "<Esc>:q<cr>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format()
  vim.cmd("write")
end, { noremap = true , silent = true, desc = "[c]ode [f]ormat"})

vim.keymap.set('n', '<leader>gq', function()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  local action = qf_winid > 0 and 'cclose' or 'copen'
  vim.cmd('botright ' .. action)
end, { desc = "toggle quicklist", noremap = true, silent = true })

-- Window stuff
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- buffer stuff
vim.keymap.set("n", "<C-q>", "<Esc>:bw<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bn", "<Esc>:bnext<cr>", { desc = "buffer [n]ext", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bp", "<Esc>:bprev<cr>", { desc = "buffer [p]revious", silent = true, noremap = true })
vim.keymap.set("n", "<leader>bq", "<Esc>:bw<cr>", { desc = "[q]uit buffer", silent = true, noremap = true })
