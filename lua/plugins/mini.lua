return {
  {
    'echasnovski/mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- NOTE: Remove tokyonight highlight for the minidiff git signs in signcolumn
      vim.api.nvim_set_hl(0, 'MiniDiffSignAdd', { fg = '' })
      vim.api.nvim_set_hl(0, 'MiniDiffSignDelete', { fg = '' })
      vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = '' })
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
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
      end, { desc = 'Diff View', silent = true })
    end,
  },
}
