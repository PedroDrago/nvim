return {
  'nvim-lualine/lualine.nvim',
  opts = {},
  config = function()
    local ignored = {
      'undotree',
      'harpoon',
      '[Scratch]',
      'alpha',
      'grapple',
      'dapui_watches',
      'dapui_breakpoints',
      'dapui_scopes',
      'dapui_console',
      'dapui_stacks',
      'dap-repl',
    }
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = ignored,
        ignore_focus = ignored,
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
