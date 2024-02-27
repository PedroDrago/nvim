return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onedark').setup {
        style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
      }
    end,
  },
  {
    'catppuccin/nvim',
    priority = 1000,
    lazy = false,
  },
}
