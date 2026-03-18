-- BufferLine
require("bufferline").setup({
	options = {
		separator_style = "slope",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
				if error ~= 0 then
					table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
				end
				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
				end
				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
				end
				if info ~= 0 then
					table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
				end
				return result
			end,
		},
	},
})

-- Lualine
require("lualine").setup({
	options = {
		theme = "auto",
	},
})

-- NvimTree
require("nvim-tree").setup({
	filters = {
		dotfiles = true,
	},
	view = {
		width = 25,
		side = "left",
		number = false,
	},
})

-- IndentScope
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
			fg = vim.fn.synIDattr(vim.fn.hlID("Function"), "fg"),
			bold = true,
		})
	end,
})

require("mini.indentscope").setup({
	draw = {
		delay = 100,
	},
	mappings = {
		object_scope = "ii",
		object_scope_with_border = "ai",
		goto_top = "[i",
		goto_bottom = "]i",
	},
	options = {
		border = "both",
		indent_at_cursor = true,
		n_lines = 10000,
		try_as_border = true,
	},
	symbol = "▎",
})
