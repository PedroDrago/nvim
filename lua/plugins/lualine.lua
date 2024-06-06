return {
  'nvim-lualine/lualine.nvim',
  cond = true,
  opts = {},
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'alpha' },
        ignore_focus = { 'oil', 'grapple', 'TelescopePrompt', 'minifiles' },
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_c = { 'filename', },
        lualine_c = { 'filename', { require('noice').api.statusline.mode.get, cond = require('noice').api.statusline.mode.has, color = { fg = '#ff9e64' } } },
        lualine_x = { 'grapple', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
