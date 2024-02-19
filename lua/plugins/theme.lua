return { {
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'dark',                                  -- dark, darker, cool, deep, warm, warmer, light
      toggle_style_key = "<F9>",
      toggle_style_list = { 'dark', 'warm', 'light' }, -- List of styles to toggle between
    }
    require('onedark').load()
  end
},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require('catppuccin').setup {
        flavour = 'latte',
        styles = {
          conditionals = {},
        },
      }
      -- require('catppuccin').load()
    end
  }
}
