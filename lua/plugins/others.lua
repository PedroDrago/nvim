return {
  { 'tpope/vim-sleuth', event = { 'BufReadPost', 'BufNewFile' } },
  { '42Paris/42header', event = { 'BufReadPost', 'BufNewFile' } },
  { 'numToStr/Comment.nvim', opts = {}, event = { 'BufReadPost', 'BufNewFile' } },
  { 'farmergreg/vim-lastplace' },
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }, event = { 'BufReadPost', 'BufNewFile' } },
  { 'lewis6991/gitsigns.nvim', opts = {}, event = { 'BufReadPost', 'BufNewFile' } },
  { 'tpope/vim-fugitive', event = { 'BufReadPost', 'BufNewFile' } },
  {
    'szw/vim-maximizer',
    event = { 'BufReadPost', 'BufNewFile' },
    vim.keymap.set('n', '<leader>k', ':MaximizerToggle!<CR>', { desc = 'Maximize Buffer', silent = true }),
  },
}
