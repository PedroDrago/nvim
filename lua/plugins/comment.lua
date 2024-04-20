return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    keywords = {
      ABOUT = { color = 'test' },
      SECTION = { color = 'test' },
      -- _ = { color = 'warning' },
      -- _ = { color = 'hint' },
      -- _ = { color = 'warning' },
      -- _ = { color = '#FFFFFF' },
    },
  },
  event = { 'BufReadPre', 'BufNewFile' },
}
