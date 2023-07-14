-- Basic configs
-- Lines
vim.opt.relativenumber = true
vim.opt.nu = true

-- Spaces as tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.smartindent = true
-- vim.opt.expandtab = true

-- Appeareance
vim.opt.termguicolors = true
vim.cmd.colorscheme("ayu-dark")
-- vim.cmd(":hi Normal guibg=NONE")

-- Tab appeareance
vim.cmd(":set list lcs=tab:\\ \\ ·")

-- Navigation
vim.opt.wrap = false
vim.opt.ttyfast = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Misc
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.fileencoding = "utf-8"

-- Split screens
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse
vim.opt.hidden = false
vim.opt.mouse = 'a'

