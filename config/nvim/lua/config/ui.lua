-- BufferLine
require("bufferline").setup({
	options = {
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
	},
})

-- Incline
local helpers = require("incline.helpers")
local devicons = require("nvim-web-devicons")
require("incline").setup({
	window = {
		padding = 0,
		margin = { horizontal = 0 },
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if filename == "" then
			filename = "[No Name]"
		end
		local ft_icon, ft_color = devicons.get_icon_color(filename)
		local modified = vim.bo[props.buf].modified
		return {
			ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
			" ",
			{ filename, gui = modified and "bold,italic" or "bold" },
			" ",
		}
	end,
})

-- Lualine
require("lualine").setup({
	options = {
		icons_enabled = true,
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
