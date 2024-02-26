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
  },{
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Load the colorscheme here
    -- vim.cmd.colorscheme 'tokyonight-night'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}
}
