return {
	"stevearc/oil.nvim",
	cond = function()
		if vim.g.vscode then
			return false
		else
			return true
		end
	end,
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["_"] = "actions.open_cwd",
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-s>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["<Backspace>"] = "actions.parent",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
			},
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
		})
		vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
