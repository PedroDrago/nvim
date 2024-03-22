return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'NvimTree', 'undotree', 'harpoon', '[Scratch]', 'alpha' },
        ignore_focus = { 'NvimTree', 'undotree', 'harpoon', '[Scratch]', 'alpha' },
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          { 'harpoon2', icon = '', indicators = { '1', '2', '3', '4' }, active_indicators = { '■', '■', '■', '■' }, separator = ' ' },
          { 'filetype' },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
  {
    'letieu/harpoon-lualine',
    dependencies = {
      'nvim-lualine/lualine.nvim',
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
  },
}
