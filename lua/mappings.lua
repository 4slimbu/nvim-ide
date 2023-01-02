local opts = {noremap = true, silent = true}

-- key map for switching splits
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Clear highlight after search
vim.api.nvim_set_keymap("n", "<leader><Space>", ":noh<CR>", opts)

-- TAB in general mode will move to text buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Move selected line / block of text in visual mode
-- shift + k to move up
-- shift + j to move down
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Alternate way to save and quit
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-q>", ":wq!<CR>", opts)
-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- keymap for opening nvim config file
vim.api.nvim_set_keymap("n", "<leader>ie", ":vsp $MYVIMRC<CR>", opts)

-- Terminal keymap
vim.cmd [[au BufEnter * if &buftype == 'terminal' | :startinsert | endif]]
vim.api.nvim_set_keymap("n", "<leader>st", ":split term://bash | resize 20<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vt", ":vsplit term://bash<CR>", opts)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Startify
vim.api.nvim_set_keymap("n", "<leader>ss", ":Startify<CR>", opts)
-- :SLoad    load a session
-- :SSave    save a session
-- :SDelete  delete a session
-- :SClose   close current session

-- Zoom Tooggle
vim.api.nvim_set_keymap("n", "<leader>z", ":ZoomToggle<CR>", opts)

-- Nvim Tree
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
vim.api.nvim_set_keymap("n", "<leader>1", ":NvimTreeToggle<CR>", opts)

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fi",
  "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍<CR>",
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍<CR>",
  opts
)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope search_history<CR>", opts)
vim.api.nvim_set_keymap(
  "n",
  "<C-p>",
  ":lua require'telescope'.extensions.project.project{}<CR>",
  {noremap = true, silent = true}
)

-- Search and Replace: Quickfix
vim.api.nvim_set_keymap("n", "<leader>gr", ":GrepperRg", opts)
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

-- vim-floaterm keymap
vim.api.nvim_set_keymap("n", "<leader>to", ":FloatermNew<CR>", opts)
vim.api.nvim_set_keymap("t", "<leader>to", "<C-\\><C-n>:FloatermNew<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tp", ":FloatermPrev<CR>", opts)
vim.api.nvim_set_keymap("t", "<leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tn", ":FloatermNext<CR>", opts)
vim.api.nvim_set_keymap("t", "<leader>tn", "<C-\\><C-n>:FloatermNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tt", ":FloatermToggle<CR>", opts)
vim.api.nvim_set_keymap("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tk", ":FloatermKill<CR>", opts)
vim.api.nvim_set_keymap("t", "<leader>tk", "<C-\\><C-n>:FloatermKill<CR>", opts)

