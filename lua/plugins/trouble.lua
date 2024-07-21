return {
  'folke/trouble.nvim',
  keys = {
    {
      '<leader>x',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
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
