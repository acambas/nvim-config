return {
	{
		--        Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "windwp/nvim-ts-autotag", config = true },
			{ "nvim-treesitter/nvim-treesitter-context" },
		},
		cond = function()
			if vim.g.vscode then
				return false
			else
				return true
			end
		end,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"rust",
					"javascript",
					"typescript",
					"css",
					"html",
					"sql",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				autopairs = {
					enable = true,
				},
				indent = { enable = true },
				autotag = {
					enable = true,
					-- enable_rename = true,
					-- enable_close = true,
					-- enable_close_on_slash = true,
					-- filetypes = { "html", "xml" },
					filetypes = {
						"html",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"svelte",
						"vue",
						"tsx",
						"jsx",
						"rescript",
						"xml",
						"php",
						"markdown",
						"astro",
						"glimmer",
						"handlebars",
						"hbs",
					},
				},
			})
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context()
			end, { silent = true })
		end,
	},
}
