return {
	{
		"Mofiqul/vscode.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		cond = function()
			if vim.g.vscode then
				return false
			else
				return true
			end
		end,
		config = function()
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				-- Alternatively set style in setup
				-- style = 'light'
				-- Override colors (see ./lua/vscode/colors.lua)
				color_overrides = {
					vscLineNumber = "#FFFFFF",
				},
				-- Enable transparent background
				transparent = true,

				-- Enable italic comment
				italic_comments = true,

				-- Disable nvim-tree background color
				disable_nvimtree_bg = true,
				-- Override highlight groups (see ./lua/vscode/theme.lua)
				group_overrides = {
					-- this supports the same val table as vim.api.nvim_set_hl
					-- use colors from this colorscheme by requiring vscode.colors!
					Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
				},
			})
			require("vscode").load()
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		cond = function()
			if vim.g.vscode then
				return false
			else
				return true
			end
		end,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})

			vim.cmd("colorscheme github_dark")
		end,
	},
}
