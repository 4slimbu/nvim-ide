local M = {}

function M.change_to_node_directory()
  local node = require('nvim-tree.lib').get_node_at_cursor()
  if node then
    vim.cmd('lcd ' .. node.absolute_path)
    print('Changed directory to ' .. node.absolute_path)
  end
end

function M.grep_at_current_tree_node()
  local node = require('nvim-tree.lib').get_node_at_cursor()
  if not node then
    -- If no node is present, use the root directory
    node = require('nvim-tree.lib').get_node_at_path(vim.fn.getcwd())
  elseif node.type == 'file' then
    print("hello")
    print(node.absolute_path)
    -- If node is a file, use its parent directory
    local dir = require('nvim-tree.lib.Dir').new(node.absolute_path):parent()
    node = dir and dir._node or node
  end
  require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
end

function M.on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', '<M-s>', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', '<Leader>gf', ":lua require'configs.nvim-tree'.grep_at_current_tree_node()<CR>", opts('Run System'))
  vim.keymap.set("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next)
  vim.keymap.set("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev)
  vim.keymap.set("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select)
end

function M.setup()
  vim.g.project_path = vim.fn.getcwd()

  require "nvim-tree".setup {
    -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    disable_netrw = false,
    -- hide_root_folder = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    view = {
      width = 30,
      side = "right",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    renderer = {
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  "
        }
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true
        },
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = ""
          },
          git = {
            unstaged = "",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "ﮁ",
            ignored = "◌"
          }
        }
      },
      add_trailing = true
    },
    hijack_directories = {
      enable = true,
      auto_open = true
    },
    update_focused_file = {
      enable = false,
      update_cwd = true,
      ignore_list = {}
    },
    system_open = {
      cmd = nil,
      args = {}
    },
    diagnostics = {
      enable = false,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = ""
      }
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {}
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 400
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" }
          }
        }
      }
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false
      }
    },
    -- remove_keymaps = { 's' },
    on_attach = M.on_attach
  } -- END_DEFAULT_OPTS
end

return M
