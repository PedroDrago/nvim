return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    require('ibl').setup {
      scope = { enabled = true },
      enabled = true,
      indent = {
        char = '│',
        tab_char = '│',
      },
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
    }
    vim.api.nvim_create_user_command('IndentlineToggle', function()
      require('ibl').setup_buffer(0, {
        enabled = not require('ibl.config').get_config(0).enabled,
      })
    end, { desc = 'Toggle Indent Line' })
  end,
}
