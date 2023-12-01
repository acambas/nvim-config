return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup()
		vim.keymap.set("n", "<c-t>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<c-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<c-n>", "<C-\\><C-n>")
	end,
}
-- return {
-- 	"ryanmsnyder/toggleterm-manager.nvim",
-- 	dependencies = {
-- 		"akinsho/nvim-toggleterm.lua",
-- 		"nvim-telescope/telescope.nvim",
-- 		"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
-- 	},
-- 	config = function()
-- 		require("toggleterm").setup({
-- 			size = 20,
-- 			start_in_insert = true,
-- 		})
-- 		local toggleterm_manager = require("toggleterm-manager")
-- 		local actions = toggleterm_manager.actions
--
-- 		toggleterm_manager.setup({
-- 			mappings = { -- key mappings bound inside the telescope window
-- 				i = {
-- 					["<CR>"] = { action = actions.toggle_term, exit_on_action = false }, -- toggles terminal open/closed
-- 					["<C-i>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
-- 					["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
-- 					["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
-- 				},
-- 			},
-- 		})
--
-- 		vim.keymap.set({ "n", "t" }, "<c-t>", function()
-- 			local count = vim.v.count
-- 			require("toggleterm").toggle(count, 20, vim.loop.cwd(), "horizontal")
-- 		end, { noremap = true })
-- 		vim.keymap.set("t", "<c-n>", "<C-\\><C-n>")
-- 		vim.keymap.set("n", "<leader>tt", "<cmd>Telescope toggleterm_manager<cr>")
-- 		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
-- 		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
-- 		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
-- 		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
-- 		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
-- 	end,
-- }
