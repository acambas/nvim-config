local vscode_disable = function()
	if vim.g.vscode then
		return false
	else
		return true
	end
end

return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		-- enabled = false,
		config = function()
			require("github-theme").setup()
			vim.cmd("colorscheme rose-pine-moon")
		end,
		cond = vscode_disable,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		-- enabled = false,
		config = function()
			require("onedark").setup()
		end,
		cond = vscode_disable,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		cond = vscode_disable,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup()

			-- vim.cmd("colorscheme github_dark_tritanopia")
		end,
	},
}
