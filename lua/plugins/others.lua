return {
  { 'tpope/vim-sleuth', cond = true, event = { 'BufReadPost', 'BufNewFile' } },
  { 'farmergreg/vim-lastplace', cond = true },
  { 'tpope/vim-fugitive', cond = true, event = { 'BufReadPre', 'BufNewFile' } },
}
