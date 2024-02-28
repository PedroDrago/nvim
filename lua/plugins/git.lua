return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
    event = { 'BufReadPost', 'BufNewFile' },
  },
  { 'tpope/vim-fugitive', event = { 'BufReadPost', 'BufNewFile' } },
}
