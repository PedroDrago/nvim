return {
  {
    'echasnovski/mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.move').setup {
        mappings = {
          left = '<Nop>',
          right = '<Nop>',
          down = 'J', -- NOTE: May want to enable only line_up and line_down
          up = 'K',
          line_left = '<Nop>',
          line_right = '<Nop>',
          line_down = 'J',
          line_up = 'K',
        },
      }
      require('mini.diff').setup {
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '_' },
        },
        delay = {
          text_change = 100, -- 200 was the default
        },
      }
      vim.keymap.set('n', '<leader>df', function()
        MiniDiff.toggle_overlay(0)
      end, { desc = 'Diff View' })
    end,
  },
}
