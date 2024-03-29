return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      sidebars = { 'help' },
      day_brightness = 0.5,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    },
    init = function()
      vim.cmd 'colorscheme tokyonight-night'
      -- Remove tokyonight highlight for minidiff git signs in signcolumn
      vim.api.nvim_set_hl(0, 'MiniDiffSignAdd', { fg = '' })
      vim.api.nvim_set_hl(0, 'MiniDiffSignDelete', { fg = '' })
      vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = '' })
    end,
  },
}
