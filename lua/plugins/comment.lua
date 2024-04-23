return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = false,
    keywords = {
      ABOUT = { color = 'test' },
      SECTION = { color = 'test' },
    },
  },
}
