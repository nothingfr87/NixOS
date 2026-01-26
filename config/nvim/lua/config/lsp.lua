-- LSP
local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	"pyright",
	"clangd",
	"ts_ls",
	"html",
	"cssls",
	"emmet_ls",
}

for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		capabilities = capabilities,
	})
end

-- Fixed lua_ls autoattach
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.bo.filetype == "lua" then
			vim.lsp.enable("lua_ls")
		end
	end,
})
vim.lsp.enable(servers)

-- NixD configurations
vim.lsp.config("nixd", {
	formatting = {
		command = { "nixfmt" },
	},
})
vim.lsp.enable("nixd")

-- Blink
require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = { "cancel" },
		["<C-Space>"] = { "show" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
		},
		trigger = {
			show_on_keyword = true,
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "cmdline" },
	},
})

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
