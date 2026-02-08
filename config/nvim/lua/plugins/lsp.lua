return {
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "master",
		build = ":TSUpdate",
	},
	-- CMP
	{
		"saghen/blink.cmp",
		version = "1.*",
	},
	-- Conform
	{
		"stevearc/conform.nvim",
	},
}
