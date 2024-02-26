return {
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  { '42Paris/42header' },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, event = { 'BufReadPost', 'BufNewFile' } },
  -- Remember last place on each file
  { 'farmergreg/vim-lastplace' },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }, event = { 'BufReadPost', 'BufNewFile' } },
}
