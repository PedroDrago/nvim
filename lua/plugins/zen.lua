return {
  {
    'folke/zen-mode.nvim',
    keys = { { '<leader>z', '<cmd>ZenMode<CR>', desc = 'Zen Mode' } },
    opts = {
      plugins = {
        twilight = { enabled = false },
      },
      window = {
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
        vim.cmd 'highlight ZenBg guibg=guidfg' -- WARN: Remove this when plugin is patched
      end,
      on_close = function()
        vim.diagnostic.enable()
        require('cmp').setup.buffer { enabled = true }
      end,
    },
  },
}
