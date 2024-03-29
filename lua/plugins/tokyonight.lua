return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false }, -- fg | bg | sp | blend | | bold | standout | underline | undercurl | underdouble | underdoted | underdashed | strikethrough | italic | reverse | nocombine | link | default | ctermfg | ctermbg | cterm | set | map | force
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = 'dark',
        floats = 'dark',
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
      ---@param c ColorScheme
      on_highlights = function(hl, c) -- Change highlights
        hl.MiniDiffSignAdd = {
          bg = '', -- c.bg_dark
          fg = '', -- c.fg_drak
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
