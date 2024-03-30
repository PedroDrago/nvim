return {
  'folke/zen-mode.nvim',
  dependencies = {},
  keys = { { '<leader>z', ':ZenMode<CR>', desc = 'Zen Mode', silent = true } },
  opts = {
    window = {
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        foldcolumn = '0',
      },
    },
    on_open = function(win)
      vim.api.nvim_command 'LspStop'
      require('cmp').setup.buffer { enabled = false }
    end,
    on_close = function()
      vim.api.nvim_command 'LspStart'
      require('cmp').setup.buffer { enabled = true }
    end,
  },
}
