-- vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_custom_header = {}
vim.api.nvim_exec(
  [[
    let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   Current Dir '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
  ]],
  true
)
