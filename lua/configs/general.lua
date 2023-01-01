--set leader key
vim.g.mapleader = ","

--set line number
vim.opt.number = true
vim.opt.relativenumber = true

-- case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight
vim.opt.hlsearch = true
vim.cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"

-- tab and indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- copy to clipboard"
vim.opt.clipboard = "unnamedplus"

-- set cursorline"
vim.opt.cursorline = true

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- treat dash separated words as a word text object
vim.opt.iskeyword:append("-")

vim.opt.mouse = "nv"
