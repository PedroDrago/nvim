return { -- TODO: Remove When finished cub3d
  {
    'PedroDrago/c_formatter_42.vim',
    event = { 'BufReadPre', 'BufNewFile' },
    vim.api.nvim_create_user_command('Norm', '<cmd>CFormatter42', {}),
  },
  {
    'PedroDrago/42header',
    keys = { { '<F10>', '<cmd>Stdheader<CR>', desc = '42 Header' } },
  },
}
