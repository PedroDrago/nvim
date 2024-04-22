return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false }, -- any attr-list value for :help nvim_set_hl
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = 'dark', -- dark, transparent or normal
        floats = 'normal', -- dark, transparent or normal
      },
      sidebars = { 'help' },
      day_brightness = 0.5,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      -----------------------------------
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.gitSigns.add = '#B3F6C0'
        colors.gitSigns.change = '#8CF8F7'
        colors.gitSigns.delete = '#FFC0B9'
      end,
      ---@param hl Highlights
      ---@param colors ColorScheme
      on_highlights = function(hl, colors)
        hl.MiniDiffSignAdd = {
          fg = colors.gitSigns.add,
          bg = '',
        }
        hl.MiniDiffSignChange = {
          fg = colors.gitSigns.change,
          bg = '',
        }
        hl.MiniDiffSignDelete = {
          fg = colors.gitSigns.delete,
          bg = '',
        }
      end,
    },
    init = function()
      vim.cmd 'colorscheme tokyonight-night'
    end,
  },
}
