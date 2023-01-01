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

-- set theme
if vim.fn.has("termguicolors") == 1 then
  --  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  -- vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end
--vim.g.gruvbox_enable_italic = 1
--vim.g.gruvbox_sign_column_background = "none"
vim.cmd "color dracula"

