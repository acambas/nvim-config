return {
	{
		--        Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "drybalka/tree-climber.nvim" },
			"ziontee113/syntax-tree-surfer",
			-- { "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "windwp/nvim-ts-autotag", config = true },
			-- { "nvim-treesitter/nvim-treesitter-refactor" },
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
				-- refactor = {
				-- 	-- highlight_current_scope = { enable = true },
				-- 	highlight_definitions = {
				-- 		enable = true,
				-- 		-- Set to false if you have an `updatetime` of ~100.
				-- 		clear_on_cursor_move = true,
				-- 	},
				-- 	navigation = {
				-- 		enable = true,
				-- 		-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
				-- 		keymaps = {
				-- 			goto_definition = "gnd",
				-- 			-- list_definitions = "gnD",
				-- 			-- list_definitions_toc = "gO",
				-- 			-- goto_next_usage = "<a-*>",
				-- 			-- goto_previous_usage = "<a-#>",
				-- 		},
				-- 	},
				-- },
			})
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context()
			end, { silent = true })

			local keyopts = { noremap = true, silent = true }
			vim.keymap.set({ "n", "v", "o" }, "gk", require("tree-climber").goto_parent, keyopts)
			-- vim.keymap.set({ "n", "v", "o" }, "2", require("tree-climber").goto_child, keyopts)
			-- vim.keymap.set({ "n", "v", "o" }, "3", require("tree-climber").goto_next, keyopts)
			-- vim.keymap.set({ "n", "v", "o" }, "4", require("tree-climber").goto_prev, keyopts)
			-- vim.keymap.set({ "v", "o" }, "in", require("tree-climber").select_node, keyopts)
			-- vim.keymap.set("n", "<c-k>", require("tree-climber").swap_prev, keyopts)
			-- vim.keymap.set("n", "<c-j>", require("tree-climber").swap_next, keyopts)
			vim.keymap.set("n", "<c-h>", require("tree-climber").highlight_node, keyopts)
		end,
	},
}
