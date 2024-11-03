return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = true }, -- any attr-list value for :help nvim_set_hl
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = 'dark', -- dark, transparent or normal
        floats = 'dark', -- dark, transparent or normal
      },
      sidebars = { 'help', 'qf', 'terminal' },
      day_brightness = 0.5,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      on_colors = function(colors)
        colors.git.add = '#B3F6C0'
        colors.git.change = '#8CF8F7'
        colors.git.delete = '#FFC0B9'
      end,
      on_highlights = function(hl, colors)
        hl.LineNr = {
          fg = colors.orange,
        }
        hl.MiniDiffSignAdd = {
          fg = colors.git.add,
          bg = '',
        }
        hl.MiniDiffSignChange = {
          fg = colors.git.change,
          bg = '',
        }
        hl.MiniDiffSignDelete = {
          fg = colors.git.delete,
          bg = '',
        }
      end,
    }
  end,
}
