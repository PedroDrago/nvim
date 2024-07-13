return {
  {
    'echasnovski/mini.nvim',
    cond = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.git').setup { n_lines = 500 }
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.move').setup {
        mappings = {
          left = '<Nop>',
          right = '<Nop>',
          down = 'J',
          up = 'K',
          line_left = '<Nop>',
          line_right = '<Nop>',
          line_down = '<Nop>',
          line_up = '<Nop>',
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
