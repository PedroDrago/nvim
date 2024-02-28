return {
  { 'tpope/vim-sleuth' },
  { '42Paris/42header' },
  { 'numToStr/Comment.nvim', opts = {}, event = { 'BufReadPost', 'BufNewFile' } },
  { 'farmergreg/vim-lastplace' },
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }, event = { 'BufReadPost', 'BufNewFile' } },
  { 'szw/vim-maximizer', vim.keymap.set('n', '<leader>k', ':MaximizerToggle!<CR>', { desc = 'Maximize Buffer', silent = true }) },
  -- { 'LunarVim/bigfile.nvim', opts = {} },
}
