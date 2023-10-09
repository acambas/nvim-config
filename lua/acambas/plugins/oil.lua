return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  config = function ()
    require("oil").setup({
      show_hidden = true,
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<BS>"] = "actions.parent",
        ["<C-r>"] = "actions.refresh",
      }
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
