return {
  'folke/tokyonight.nvim',
  cond = vim.g.tokyonight,
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- any attr-list value for :help nvim_set_hl
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
    }
    local colors = {
      border = 'none', -- NOTE:  No border | bg different than bg
      winhighlight = 'Normal:Pmenu,FloatBorder:Normal',

      -- border = 'rounded', --  NOTE: No border | bg different than bg
      -- winhighlight = 'Normal:Normal',
    }
    local cmp = require 'cmp'
    cmp.setup {
      window = {
        documentation = cmp.config.window.bordered {
          border = colors.border,
          winhighlight = colors.winhighlight,
        },
        completion = cmp.config.window.bordered {
          border = colors.border,
          winhighlight = colors.winhighlight,
          scrollbar = false,
        },
      },
    }
  end,
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    -- vim.cmd.colorscheme 'tokyonight-storm'
  end,
}
