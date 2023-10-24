local q = {
	{
		enabled = false,
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
		cond = function()
			if vim.g.vscode then
				return false
			else
				return true
			end
		end,
		config = function()
			require("neoconf").setup({
				-- override any of the default settings here
			})
			local lspconfig = require("lspconfig")
			-- local lsp_defaults = lspconfig.util.default_config
			-- Setup neovim lua configuration
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tsserver",
					"eslint",
					"html",
					"cssls",
					"jsonls",
					"tailwindcss",
				},

				automatic_installation = true,
				handlers = {
					function(server)
						lspconfig[server].setup({})
					end,
					["eslint"] = function()
						lspconfig.eslint.setup({
							on_attach = function(client)
								client.server_capabilities.documentFormattingProvider = true
							end,
						})
					end,
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							filetypes = { "lua" },
							settings = {
								Lua = {
									diagnostics = {
										-- Get the language server to recognize the `vim` global
										globals = { "vim" },
									},
								},
							},
						})
					end,
				},
			})
			require("neodev").setup()
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	callback = function()
			-- 		vim.lsp.buf.format()
			-- 	end,
			-- })
			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local nmap = function(keys, func, desc)
						if desc then
							desc = "LSP: " .. desc
						end
						vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
					end
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					nmap("gD", vim.lsp.buf.declaration, "[g]o to [D]eclaration")
					nmap("gd", vim.lsp.buf.definition, "[g]o to [d]efinition")
					nmap("gh", vim.lsp.buf.hover, "go to [h]over")
					nmap("gi", vim.lsp.buf.implementation, "[g]o to [i]mplementation")
					nmap("gI", require("telescope.builtin").lsp_implementations, "[g]oto [I]mplementations")
					nmap("gt", vim.lsp.buf.type_definition, "[g]o to [t]ype definition")
					-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf })
					-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf })
					-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf })
					-- vim.keymap.set('n', '<leader>wl', function()
					--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, { buffer = ev.buf })
					nmap("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
					nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
					nmap("gr", require("telescope.builtin").lsp_references, "[g]oto [R]eferences")
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf })
				end,
			})
		end,
	},
	{
		enabled = false,

		cond = function()
			if vim.g.vscode then
				return false
			else
				return true
			end
		end,
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
		config = function()
			-- [[ Configure nvim-cmp ]]
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					format = function(entry, vim_item)
						if vim.tbl_contains({ "path" }, entry.source.name) then
							local icon, hl_group =
								require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
							if icon then
								vim_item.kind = icon
								vim_item.kind_hl_group = hl_group
								return vim_item
							end
						end
						return require("lspkind").cmp_format({ with_text = true })(entry, vim_item)
					end,
				},
				experimental = {
					ghost_text = false,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local setupServers = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
				"eslint",
				"html",
				"cssls",
				"jsonls",
				"tailwindcss",
			}
			local lspconfig = require("lspconfig")
			for _, v in pairs(setupServers) do
				lspconfig[v].setup({
					capabilities = capabilities,
				})
			end
			-- require("lspconfig").cssls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- require("lspconfig").html.setup({
			-- 	capabilities = capabilities,
			-- })
			-- require("lspconfig").typescript.setup({
			-- 	capabilities = capabilities,
			-- })
			-- require("lspconfig").lua_ls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- require("lspconfig").tailwindcss.setup({
			-- 	capabilities = capabilities,
			-- })
		end,
	},
}
return {}
