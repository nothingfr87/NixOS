return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
}
