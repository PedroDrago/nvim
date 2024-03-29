return {
  'lukas-reineke/indent-blankline.nvim',
  keys = {
    {
      '<leader>i',
      function()
        require('ibl').setup_buffer(0, {
          enabled = not require('ibl.config').get_config(0).enabled,
        })
      end,
    },
  },
  opts = {
    enabled = false,
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'lazy',
        'mason',
        'terminal',
        'spectre',
      },
    },
  },
  main = 'ibl',
}
