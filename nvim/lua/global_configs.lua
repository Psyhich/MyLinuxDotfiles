-- Basic configs
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.fileencoding = "utf-8"

-- Spaces as tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Appeareance
vim.opt.termguicolors = true
vim.cmd(":colorscheme ayu")
-- vim.cmd(":hi Normal guibg=NONE")

-- Tab appeareance
vim.cmd(":set list lcs=tab:\\ \\ ·")

-- Navigation
vim.opt.wrap = false
vim.opt.ttyfast = true

-- Split screens
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse
vim.opt.hidden = false
vim.opt.mouse = 'a'

