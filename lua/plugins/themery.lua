return {
  {
    'zaldih/themery.nvim',
    event = 'VeryLazy',
    config = function()
      require('themery').setup {
        themes = { 'tokyonight-night', 'tokyonight-storm', 'catppuccin-mocha', 'catppuccin-macchiato', 'onedark' },
        themeConfigFile = '~/.config/nvim/lua/colors.lua',
        livePreview = true,
      }
    end,
  },
}
