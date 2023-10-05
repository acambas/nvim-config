local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    " filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
--    " branch=stable",   latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {import = "acambas.plugins"},
  {import = "acambas.plugins.lsp"}
})
--  require("lazy").setup({
--    { 'folke/which-key.nvim' },
--    { "folke/neoconf.nvim",  cmd = "Neoconf" },
--    { "folke/neodev.nvim" },
--    {
--      'nvim-telescope/telescope.nvim',
--      tag = '0.1.3',
--        or                              , branch = '0.1.x',
--      dependencies = { 'nvim-lua/plenary.nvim' }
--    },
--    {
--      "nvim-lualine/lualine.nvim",
--      dependencies = { "nvim-tree/nvim-web-devicons" }
--    },
--    {
--        Highlight, edit, and navigate code
--      'nvim-treesitter/nvim-treesitter',
--      dependencies = {
--        'nvim-treesitter/nvim-treesitter-textobjects',
--      },
--      build = ':TSUpdate',
--    },
--    {
--      "folke/tokyonight.nvim",
--      lazy = false,
--      priority = 1000,
--      opts = {},
--    },
--    { "lukas-reineke/indent-blankline.nvim", main = "ibl",   opts = {} },
--                -LSP                     -
--    { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },
--    { 'neovim/nvim-lspconfig' },
--    { 'hrsh7th/cmp-nvim-lsp' },
--    { 'hrsh7th/nvim-cmp' },
--    { 'L3MON4D3/LuaSnip' },
--    { "williamboman/mason.nvim" },
--    { 'williamboman/mason-lspconfig.nvim' },
--                                     
--    {
--      "folke/flash.nvim",
--      event = "VeryLazy",
--      opts = {},
--      keys = {
--        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
--        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
--        { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
--        {
--          "R",
--          mode = { "o", "x" },
--          function() require("flash").treesitter_search() end,
--          desc =
--          "Treesitter Search"
--        },
--        {
--          "<c-s>",
--          mode = { "c" },
--          function() require("flash").toggle() end,
--          desc =
--          "Toggle Flash Search"
--        },
--      },
--    },
--    { "terrortylor/nvim-comment" },
--    { "kevinhwang91/nvim-bqf",   opts = {} },
--    { "nvim-lua/plenary.nvim"},
--    { "nvim-pack/nvim-spectre"}
--  })
