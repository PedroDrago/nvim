return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
    event = { 'BufReadPost', 'BufNewFile' },

    vim.keymap.set('n', '<leader>y', ':Gitsigns preview_hunk<CR>', { desc = 'Git Hunk', silent = true }),
  },
  { 'tpope/vim-fugitive', event = { 'BufReadPost', 'BufNewFile' } },
  {
    'sindrets/diffview.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
    vim.keymap.set(
      'n',
      '<leader>d',
      ':DiffviewOpen<CR>',
      { desc = 'Diffview Open', silent = true },
      vim.keymap.set('n', '<leader>D', ':tabclose<CR>', { desc = 'Diffview Close', silent = true })
    ),
  },
}
