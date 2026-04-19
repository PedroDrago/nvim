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
      vim.b[vim.api.nvim_get_current_buf()].zen_disable_blink = true
      pcall(function()
        require('blink.cmp').hide()
      end)
    end,
    on_close = function()
      vim.diagnostic.enable(true)
      vim.b[vim.api.nvim_get_current_buf()].zen_disable_blink = false
    end,
  },
}
