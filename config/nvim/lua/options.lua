local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Settings
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.softtabstop = 2
o.relativenumber = true
o.number = true
o.cursorline = true
o.mousemoveevent = true
o.termguicolors = true
o.swapfile = false
o.mouse = "a"
o.wrap = false
o.ignorecase = false
o.laststatus = 3
o.showmode = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.clipboard = "unnamedplus"
vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true })
cmd("cnoreabbrev q q!")
cmd("cnoreabbrev qa qall!")
cmd("cnoreabbrev w w!")
cmd("cnoreabbrev wq wq!")
cmd("syntax on")
cmd("filetype plugin indent on")
