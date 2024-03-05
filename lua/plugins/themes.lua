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
    {
      'zaldih/themery.nvim',
      event = 'VeryLazy',
      config = function()
        require('themery').setup {
          themes = { 'tokyonight-night', 'tokyonight-storm' },
          themeConfigFile = '~/.config/nvim/lua/colors.lua',
          livePreview = true,
        }
      end,
    },
  },
}
-- TODO:  Keybinding for persistent theme swap between night and storm
