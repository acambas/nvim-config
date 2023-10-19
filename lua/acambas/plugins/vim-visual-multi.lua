return {
	"mg979/vim-visual-multi",
	event = "VeryLazy",
	init = function()
		vim.g.VM_maps = {
			["Select Cursor Down"] = "<C-J>",
			["Select Cursor Up"] = "<C-K>",
		}
	end,
	config = function() end,
}
