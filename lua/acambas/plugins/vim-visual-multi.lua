return {
	"mg979/vim-visual-multi",
	event = "VeryLazy",
	enabled = false,
	cond = function()
		if vim.g.vscode then
			return false
		else
			return true
		end
	end,
	init = function()
		vim.g.VM_maps = {
			["Select Cursor Down"] = "<C-J>",
			["Select Cursor Up"] = "<C-K>",
		}
	end,
	config = function() end,
}
