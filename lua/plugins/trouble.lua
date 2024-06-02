-- return {
--   'folke/trouble.nvim',
--   cond = true,
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   keys = {
--     { '<leader>x', '<cmd>TroubleToggle document_diagnostics<CR>', desc = 'Toggle Troubble' },
--   },
-- }
return {
  'folke/trouble.nvim',
  keys = {
    {
      '<leader>x',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>X',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
  opts = {
    auto_fold = false,
    -- signs = {
    --   error = '',
    --   warning = '',
    --   hint = '',
    --   information = '',
    --   other = '',
    -- },
  }, -- for default options, refer to the configuration section for custom setup.
}
