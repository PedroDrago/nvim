return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
    vim.keymap.set('n', '<leader>y', ':Gitsigns preview_hunk<CR>', { desc = 'Display Git Hunk', silent = true }),
  },
  { 'tpope/vim-fugitive' },
  { 'sindrets/diffview.nvim' }, -- optional - Diff integration
}
