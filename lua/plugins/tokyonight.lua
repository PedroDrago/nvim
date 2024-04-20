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
      on_colors = function(colors) -- Change colors
        -- colors.hint = colors.orange
        -- colors.error = '#ff0000'
      end,
      ---@param hl Highlights
      ---@param colors ColorScheme
      on_highlights = function(hl, colors) -- Change highlights
        hl.MiniDiffSignAdd = {
          bg = '',
          fg = '',
        }
        hl.MiniDiffSignDelete = {
          bg = '',
          fg = '',
        }
        hl.MiniDiffSignChange = {
          bg = '',
          fg = '',
        }
      end,
    },
    init = function()
      vim.cmd 'colorscheme tokyonight-night'
    end,
  },
}
