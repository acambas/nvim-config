return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup()
		vim.keymap.set("n", "<c-t>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<c-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<c-n>", "<C-\\><C-n>")
	end,
}
