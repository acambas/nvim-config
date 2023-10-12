return {
	{
		--        Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "windwp/nvim-ts-autotag", config = true },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
		},
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
				refactor = {
					-- highlight_current_scope = { enable = true },
					highlight_definitions = {
						enable = true,
						-- Set to false if you have an `updatetime` of ~100.
						clear_on_cursor_move = true,
					},
					navigation = {
						enable = true,
						-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
						keymaps = {
							goto_definition = "gnd",
							-- list_definitions = "gnD",
							-- list_definitions_toc = "gO",
							-- goto_next_usage = "<a-*>",
							-- goto_previous_usage = "<a-#>",
						},
					},
				},
			})
		end,
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-refactor",
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			refactor = {
	-- 				-- highlight_current_scope = { enable = true },
	-- 				highlight_definitions = {
	-- 					enable = true,
	-- 					-- Set to false if you have an `updatetime` of ~100.
	-- 					clear_on_cursor_move = true,
	-- 				},
	-- 				navigation = {
	-- 					enable = true,
	-- 					-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
	-- 					keymaps = {
	-- 						goto_definition = "gnd",
	-- 						-- list_definitions = "gnD",
	-- 						-- list_definitions_toc = "gO",
	-- 						-- goto_next_usage = "<a-*>",
	-- 						-- goto_previous_usage = "<a-#>",
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	config()({
	-- 		require("nvim-treesitter.configs").setup({
	-- 			autotag = {
	-- 				enable = true,
	-- 				enable_rename = true,
	-- 				enable_close = true,
	-- 				enable_close_on_slash = true,
	-- 				filetypes = { "html", "xml" },
	-- 			},
	-- 		}),
	-- 	}),
	-- },
}
