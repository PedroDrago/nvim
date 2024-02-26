return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onedark').setup {
        style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
        -- toggle_style_key = '<F9>',
        -- toggle_style_list = { 'dark', 'warm', 'light' }, -- List of styles to toggle between
      }
    end,
  },
}
