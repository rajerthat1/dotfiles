return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = { "folke/snacks.nvim", lazy = true },
	keys = {
		{ "-", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Yazi here" },
		{ "=", mode = { "n", "v" }, "<cmd>Yazi toggle<cr>", desc = "Yazi toggle" },
		{ "_", "<cmd>Yazi cwd<cr>", desc = "Yazi in directory" },
	},
	opts = { open_for_directories = false },
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
