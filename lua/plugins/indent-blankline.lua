return {
  'lukas-reineke/indent-blankline.nvim',
  keys = {
    {
      '<leader>i',
      function()
        require('ibl').setup {
          require('ibl').setup_buffer(0, {
            enabled = not require('ibl.config').get_config(0).enabled,
          }),
        }
      end,
    },
  },
  config = function()
    require('ibl').setup {
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
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    }
  end,
  main = 'ibl',
}
