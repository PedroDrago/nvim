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
      { '<leader>e', hidden = true }, -- hide this keymap
      { '<leader>E', hidden = true }, -- hide this keymap
      { '<leader>a', hidden = true }, -- hide this keymap
      { '<leader>A', hidden = true }, -- hide this keymap
      { '<leader>t', hidden = true }, -- hide this keymap
      { '<leader>T', hidden = true }, -- hide this keymap
      { '<leader>f', hidden = true }, -- hide this keymap
      { '<leader>/', hidden = true }, -- hide this keymap
      { '<leader>g', hidden = true }, -- hide this keymap
      { '<leader>j', hidden = true }, -- hide this keymap
      { '<leader>v', hidden = true }, -- hide this keymap
      { '<leader>V', hidden = true }, -- hide this keymap
      { '<leader>=', hidden = true }, -- hide this keymap
      { '<leader>?', hidden = true }, -- hide this keymap
    }
  end,
}
