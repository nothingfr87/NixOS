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
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "master",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter.configs")

			ts.setup({
				ensure_installed = { "c", "cpp", "python", "lua", "html", "css", "javascript", "vim", "vimdoc", "nix" },
			})
		end,
	},
}
