return {
  'folke/ts-comments.nvim',
  cond = true,
  opts = {},
  event = 'VeryLazy',
  enabled = vim.fn.has 'nvim-0.10.0' == 1,
}
-- FIX: Only needs this because vanilla commenting in C is shit (Uses multiline /* */ comments instead of //). Figure out how to change by hande and get rid of this plugin
