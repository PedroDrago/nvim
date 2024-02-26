return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup = {
      icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '',
      },
      window = {
        border = 'single',
        position = 'bottom',
        margin = { 0, 0, 0, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
      },
      layout = {
        height = { min = 5, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 4,
        align = 'left',
      },
    }
    require('which-key').register {
      -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    }
  end,
}
