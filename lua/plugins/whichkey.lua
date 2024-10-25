return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  -- TODO: Configure this (make two modes, one where everything is showed and other where only necessary things shows [i.e. thins I don't forget don't show])
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require 'which-key'
    wk.add {
      -- { '<leader>f1', hidden = true }, -- hide this keymap
    }
  end,
}
