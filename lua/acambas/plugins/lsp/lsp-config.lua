return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      -- local lsp_defaults = lspconfig.util.default_config
      -- Setup neovim lua configuration
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", 'tsserver', 'eslint', 'html', 'cssls' },
        automatic_installation = true,
        handlers = {
          function(server)
            lspconfig[server].setup({})
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                  },
                },
              },
            })
          end
        }
      })
      require('neodev').setup()

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
          end
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          nmap('gD', vim.lsp.buf.declaration, "[g]o to [D]eclaration")
          nmap('gd', vim.lsp.buf.definition, "[g]o to [d]efinition")
          nmap('H', vim.lsp.buf.hover, "[H]over")
          nmap('gi', vim.lsp.buf.implementation, "[g]o to [i]mplementation")
          nmap('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')
          -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf })
          -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf })
          -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf })
          -- vim.keymap.set('n', '<leader>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, { buffer = ev.buf })
          nmap('<leader>rn', vim.lsp.buf.rename, "[r]e[n]ame")
          nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[d]ocument [s]ymbols')
          nmap('gr', require('telescope.builtin').lsp_references, '[g]oto [R]eferences')
          nmap('<leader>D', vim.lsp.buf.type_definition, "type [D]efinition")
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf })
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, { buffer = ev.buf })
        end,
      })
    end
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      -- require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_vscode').load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end
  },
}
