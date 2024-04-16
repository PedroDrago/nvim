return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>x', '<cmd>TroubleToggle document_diagnostics<CR>', desc = 'Toggle Troubble' },
  },
  opts = {
    auto_fold = true,
    signs = {
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '',
    },
  },
}
