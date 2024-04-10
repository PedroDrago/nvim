return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>x', ':TroubleToggle<CR>', desc = 'Toggle Troubble', silent = true },
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
