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
  --    vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  --   vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end

vim.o.background = "dark" -- default is "dark" or "light" for light mode
-- vim.cmd([[colorscheme catppuccin-latte]])
vim.cmd([[colorscheme dracula]])

-- write with sudo even if its open in normal mode
vim.cmd([[
cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null' <bar> edit!
]])

-- Disable automatic indentation settings
-- vim.opt.autoindent = false
-- vim.opt.smartindent = false
--
-- Set the 'indentexpr' option to the custom expression
-- vim.o.indentexpr = "v:lua.GetIndent()"

-- Define the 'GetIndent' function to calculate indentation
function GetIndent()
  print("GetIndent() function called")
  local lnum = vim.fn.prevnonblank(vim.v.lnum - 1)
  local line = vim.fn.getline(lnum)
  local indent = vim.fn.indent(lnum)
  print(lnum, line, indent)

  if line:match('^%s*<%?php') then
    -- PHP opening tag, use the previous line's indentation
    return indent
  elseif line:match('^%s*<%?') then
    -- Short PHP opening tag, use the previous line's indentation
    return indent
  elseif line:match('^%s*<%%') then
    -- ASP-style PHP opening tag, use the previous line's indentation
    return indent
  else
    -- For other lines, use the standard indentation
    return vim.fn.indent('.')
  end
end
