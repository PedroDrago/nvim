return {
  {
    'folke/zen-mode.nvim',
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
        vim.diagnostic.disable()
        require('cmp').setup.buffer { enabled = false }
        vim.cmd 'highlight ZenBg guibg=guidfg' -- BUG: Remove when [Issue](https://github.com/folke/zen-mode.nvim/issues/115) has been resolved.
      end,
      on_close = function()
        vim.diagnostic.enable()
        require('cmp').setup.buffer { enabled = true }
      end,
    },
  },
}
