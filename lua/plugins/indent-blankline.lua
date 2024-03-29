return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('ibl').setup {
      enabled = false,
      vim.keymap.set('n', '<leader>i', function()
        require('ibl').setup_buffer(0, {
          enabled = not require('ibl.config').get_config(0).enabled,
        })
      end, { desc = 'asd', silent = true }),
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
