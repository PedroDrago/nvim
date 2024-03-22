return {
  {
    'echasnovski/mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
    end,
  },
}
