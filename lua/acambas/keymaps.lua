vim.g.mapleader = " "
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "open explorer" })
vim.keymap.set("n", "<C-s>", '<cmd>write<cr>', {
  desc = 'N: Save current file by <command-s>',
})
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>")
vim.keymap.set("n", "<C-q>", "<Esc>:q<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>bd", "<Esc>:bw<cr>", { desc = "close buffer" })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "J", "o<Esc>k")

vim.keymap.set("n", "K", "O<Esc>j")

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

local noremap_silent = { noremap = true, silent = true }

-- vim.keymap.set('n', '=l', function()
--     local win = vim.api.nvim_get_current_win()
--     local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
--     local action = qf_winid > 0 and 'lclose' or 'lopen'
--     vim.cmd(action)
-- end, noremap_silent)

vim.keymap.set('n', '<leader>q', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    local action = qf_winid > 0 and 'cclose' or 'copen'
    vim.cmd('botright '..action)
end, noremap_silent)
