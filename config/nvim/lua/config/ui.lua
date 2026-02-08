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
			guibg = "#414868",
		}
	end,
})

-- Dashoard
local dashboard = require("dashboard")

local logo = [[
███╗   ██╗██╗   ██╗██╗     ██╗     ██╗   ██╗██╗███╗   ███╗
████╗  ██║██║   ██║██║     ██║     ██║   ██║██║████╗ ████║
██╔██╗ ██║██║   ██║██║     ██║     ██║   ██║██║██╔████╔██║
██║╚██╗██║██║   ██║██║     ██║     ╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║╚██████╔╝███████╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

logo = string.rep("\n", 2) .. logo .. "\n\n"

local center = {
	{ action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
	{ action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
	{ action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
	{ action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
	{
		action = "lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/', prompt_title = 'Search Config'})",
		desc = " Config",
		icon = " ",
		key = "c",
	},
	{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
	{
		action = function()
			vim.api.nvim_input("<cmd>qa<cr>")
		end,
		desc = " Quit",
		icon = " ",
		key = "q",
	},
}

for _, button in ipairs(center) do
	button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
	button.key_format = "  %s"
end

dashboard.setup({
	theme = "doom",
	hide = {
		statusline = false,
	},
	config = {
		header = vim.split(logo, "\n"),
		center = center,
		footer = function()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
			return {
				"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
			}
		end,
	},
})

if vim.bo.filetype == "lazy" then
	vim.api.nvim_create_autocmd("WinClosed", {
		pattern = tostring(vim.api.nvim_get_current_win()),
		once = true,
		callback = function()
			vim.schedule(function()
				vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
			end)
		end,
	})
end

-- Lualine
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
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
