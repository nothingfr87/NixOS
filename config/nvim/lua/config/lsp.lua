-- LSP
local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
	"lua_ls",
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
vim.lsp.enable(servers)

-- NixD configurations
vim.lsp.config("nixd", {
	nixpkgs = {
		expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs {}",
	},
	formatting = {
		command = { "nixfmt" },
	},
})
vim.lsp.enable("nixd")

-- CMP
-- local cmp = require("cmp")
-- local lspkind = require("lspkind")
-- vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#181825" })
--
-- cmp.setup({
-- 	formatting = {
-- 		fields = { "kind", "abbr" },
-- 		format = function(_, item)
-- 			local icons = {
-- 				Text = "󰉿",
-- 				Method = "󰆧",
-- 				Function = "󰊕",
-- 				Variable = "",
-- 				File = "󰈙",
-- 				Folder = "󰉋",
-- 				Class = "󰠱",
-- 			}
-- 			item.kind = " " .. (icons[item.kind] or "") .. " "
-- 			return item
-- 		end,
-- 	},
-- 	experimental = {
-- 		ghost_text = true,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-e>"] = cmp.mapping.abort(),
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 	}),
-- 	sources = cmp.config.sources({
-- 		{ name = "nvim_lsp" },
-- 		{ name = "nvim_lsp_signature_help" },
-- 	}, {
-- 		{ name = "buffer" },
-- 		{ name = "path" },
-- 		{ name = "cmdline" },
-- 	}),
-- })
-- cmp.setup.cmdline({ "/", "?" }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- 	matching = { disallow_symbol_nonprefix_matching = false },
-- })

-- Blink
require("blink.cmp").setup({
	keymap = { preset = "default" },
	fuzzy = { implementation = "lua" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = { documentation = { auto_show = false } },
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
