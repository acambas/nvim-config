return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			start_in_insert = true,
		})

		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
	end,
	keys = {
		{
			"<c-t>",
			function()
				local count = vim.v.count
				require("toggleterm").toggle(count, 20, vim.loop.cwd(), "horizontal")
			end,
			desc = "ToggleTerm (horizontal)",
		},
	},
}
