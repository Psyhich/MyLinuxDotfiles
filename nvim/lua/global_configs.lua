-- Basic configs
-- Lines
vim.opt.relativenumber = true
vim.opt.nu = true

--vim.cmd(":set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,ж\\;,є',ґ\\,яz,чx,сc,мv,иb,тn,ьm,ю.,./,ЙQ,ЦW,УE,КR,ЕT,НY,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\\:,Є\\\",Ґ<bar>,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\\<,Ю>,№#")

-- Spaces as tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.smartindent = true
-- vim.opt.expandtab = true

-- Appeareance
vim.opt.termguicolors = true
vim.cmd.colorscheme("kanagawa")
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

