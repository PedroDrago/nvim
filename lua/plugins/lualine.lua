return {
  'nvim-lualine/lualine.nvim',
  cond = true,
  opts = {},
  dependencies = {
    'AndreM222/copilot-lualine',
  },
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
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
