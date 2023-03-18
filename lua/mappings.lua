local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--------------------------------------------
-- General Keymaps
--------------------------------------------
-- key map for switching splits
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Use alt + hjkl to resize windows
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Clear highlight after search
keymap("n", "<leader><Space>", ":noh<CR>", opts)

-- TAB in general mode will move to text buffer
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Move selected line / block of text in visual mode
-- shift + k to move up
-- shift + j to move down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Alternate way to save and quit
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":wq!<CR>", opts)
-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keymap for opening nvim config file
keymap("n", "<leader>ie", ":vsp $MYVIMRC<CR>", opts)
keymap("n", "<leader>im", ":vsp $HOME/.config/nvim/lua/mappings.lua<CR>", opts)

-- Terminal keymap
vim.cmd [[au BufEnter * if &buftype == 'terminal' | :startinsert | endif]]
keymap("n", "<leader>st", ":split term://bash | resize 20<CR>", opts)
keymap("n", "<leader>vt", ":vsplit term://bash<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Set file type as html and syntax as php for php/html file
keymap("n", "<leader>hp", ":set filetype=html|:set syntax=php<CR>", opts)

-- Clear swap
keymap("n", "<leader>sc", ":!rm -rf ~/.local/state/nvim/swap/*", opts)

--------------------------------------------
-- Startify
--------------------------------------------
keymap("n", "<leader>ss", ":Startify<CR>", opts)
-- :SLoad    load a session
-- :SSave    save a session
-- :SDelete  delete a session
-- :SClose   close current session

--------------------------------------------
-- Zoom Tooggle
--------------------------------------------
keymap("n", "<leader>z", ":ZoomToggle<CR>", opts)

--------------------------------------------
-- Nvim Tree
--------------------------------------------
-- - : go to parent directory
-- ctrl+] : go inside current directory
-- a : create file/directory (for directory add trailing slash "/")
-- r : rename
-- d : delete
-- c : copy to clipboard
-- x : cut to clipboard
-- p : paste
-- s : open file/directory in file explorer
-- g? : view all the shortcuts
keymap("n", "<leader>1", ":NvimTreeToggle<CR>", opts)

--------------------------------------------
-- Telescope
--------------------------------------------
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap(
  "n",
  "<leader>fi",
  "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍<CR>",
  opts
)
keymap(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep prompt_prefix=🔍<CR>",
  opts
)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fr", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope search_history<CR>", opts)
keymap(
  "n",
  "<C-p>",
  "<cmd>:lua require'telescope'.extensions.project.project{}<CR>",
  opts
)

--------------------------------------------
-- Search and Replace: Quickfix
--------------------------------------------
keymap("n", "<leader>gr", ":GrepperRg", opts)
-- Using Telescope:
-- use ,fg(my shortcut to search text in file using ripgrep) then search text in files
-- use tab/shift+tab to select deselect items
-- use Alt + q to add selected items to quickfix
-- use Ctrl + q to add all items to quickfix
-- Using GrepperRg:
-- ,gr [textOrPatternToSearch]
-- files will be added automatically to quickfix
-- use tab/shift+tab to select and zn or zN(act as not selected) to filter
-- copen : open quickfix
-- cdo s/pattern/replaceText/ : perform replace operation on quickfix list

--------------------------------------------
-- vim-floaterm keymap
--------------------------------------------
keymap("n", "<leader>to", ":FloatermNew<CR>", opts)
keymap("t", "<leader>to", "<C-\\><C-n>:FloatermNew<CR>", opts)
keymap("n", "<leader>tp", ":FloatermPrev<CR>", opts)
keymap("t", "<leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", opts)
keymap("n", "<leader>tn", ":FloatermNext<CR>", opts)
keymap("t", "<leader>tn", "<C-\\><C-n>:FloatermNext<CR>", opts)
keymap("n", "<leader>tt", ":FloatermToggle<CR>", opts)
keymap("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", opts)
keymap("n", "<leader>tk", ":FloatermKill<CR>", opts)
keymap("t", "<leader>tk", "<C-\\><C-n>:FloatermKill<CR>", opts)

--------------------------------------------
-- lspsaga
--------------------------------------------
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- Code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- Show cursor diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
-- Lsp Formatting
keymap('n', '<space>f', "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)

--------------------------------------------
-- Commenting
--------------------------------------------
-- update commentstring manually
keymap('n', '<space>c', "<cmd>lua require('ts_context_commentstring.internal').update_commentstring()<cr>", opts)

--------------------------------------------
-- Vim Test
--------------------------------------------
keymap("n", "<leader>tn", ":TestNearest<CR>", opts)
keymap("n", "<leader>tf", ":TestFile<CR>", opts)
keymap("n", "<leader>ts", ":TestSuite<CR>", opts)
keymap("n", "<leader>tl", ":TestLast<CR>", opts)
keymap("n", "<leader>tv", ":TestVisit<CR>", opts)

--------------------------------------------
-- Nvim Dap
--------------------------------------------
keymap("n", "<leader>dc", "<cmd>lua require 'dap'.continue()<CR>", opts)
keymap("n", "<leader>dsr", "<cmd>lua require 'dap'.step_over()<CR>", opts)
keymap("n", "<leader>dsi", "<cmd>lua require 'dap'.step_into()<CR>", opts)
keymap("n", "<leader>dso", "<cmd>lua require 'dap'.step_out()<CR>", opts)
keymap("n", "<leader>dts", "<cmd>lua require 'dap'.terminate()<CR>", opts)
-- keymap("n", "<leader>dbt", "<cmd>lua require 'dap'.toggle_breakpoint()<CR>", opts)
-- keymap(
--   "n",
--   "<leader>dbc",
--   "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
--   opts
-- )
keymap(
  "n",
  "<leader>dbl",
  "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  opts
)
keymap("n", "<leader>dro", "<cmd>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>drl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
keymap("n", "<leader>duo", "<Cmd>lua require'dapui'.open()<CR>", opts)
keymap("n", "<leader>duc", "<Cmd>lua require'dapui'.close()<CR>", opts)
keymap("n", "<leader>dut", "<Cmd>lua require'dapui'.toggle()<CR>", opts)

--------------------------------------------
-- Persistent Breakpoint
--------------------------------------------
keymap("n", "<leader>dtb", "<cmd>lua require 'persistent-breakpoints.api'.toggle_breakpoint()<CR>", opts)
keymap(
  "n",
  "<leader>dbc",
  "<Cmd>lua require 'persistent-breakpoints.api'.set_conditional_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  opts
)
keymap("n", "<leader>dcb", "<cmd>lua require 'persistent-breakpoints.api'.clear_all_breakpoints()<CR>", opts)

-- Outline
keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts)
