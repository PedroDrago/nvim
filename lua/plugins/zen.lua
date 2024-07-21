return {
  'folke/zen-mode.nvim',
  cond = true,
  keys = { { '<leader>z', '<cmd>ZenMode<CR>', desc = 'Zen Mode' } },
  opts = {
    plugins = {
      twilight = { enabled = false },
    },
    window = {
      backdrop = 1,
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        foldcolumn = '0',
      },
    },
    on_open = function(win)
      vim.diagnostic.enable(false)
      require('cmp').setup { enabled = false }
      -- TODO: Maybe disable supermaven
    end,
    on_close = function()
      vim.diagnostic.enable(true)
      require('cmp').setup.buffer { enabled = true }
    end,
  },
}
