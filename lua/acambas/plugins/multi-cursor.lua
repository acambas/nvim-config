local vscode_disable = function()
	if vim.g.vscode then
		return false
	else
		return true
	end
end

return {
	"brenton-leighton/multiple-cursors.nvim",
	config = true,
	cond = vscode_disable,
	keys = {
		-- { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i" } },
		{ "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>" },
		-- { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i" } },
		{ "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>" },
		{ "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
	},
	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
		enabled = false,
		cond = vscode_disable,
		init = function()
			vim.g.VM_maps = {
				["Select Cursor Down"] = "<C-J>",
				["Select Cursor Up"] = "<C-K>",
			}
		end,
		config = function() end,
	},
}
