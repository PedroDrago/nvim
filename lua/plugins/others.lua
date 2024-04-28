return {
  { 'tpope/vim-sleuth', cond = true, event = { 'BufReadPost', 'BufNewFile' } },
  { 'tpope/vim-fugitive', cond = true, event = { 'BufReadPre', 'BufNewFile' } },
}
