return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    -- Set custom name to the list
    vim.api.nvim_create_user_command('Theme', function()
      vim.cmd 'Themery'
    end, { desc = 'Toggle Theme List' })
    require('themery').setup {
      themes = {
        {
          name = 'Tokyonight Night',
          colorscheme = 'tokyonight-night',
          before = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Tokyonight Storm',
          colorscheme = 'tokyonight-storm',
          before = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Gruvbox',
          colorscheme = 'gruvbox-material',
          before = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
          after = [[ 
          vim.cmd 'hi FloatBorder guibg = Normal'
          vim.cmd 'hi FloatTitle guibg = Normal'
        ]],
        },
        {
          name = 'oxocarbon',
          colorscheme = 'oxocarbon',
        },
        {
          name = 'onedark',
          colorscheme = 'onedark',
          after = [[ 
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi NormalFloat guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Catppuccin Frappe',
          colorscheme = 'catppuccin-frappe',
          after = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi NormalFloat guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Catppuccin macchiato',
          colorscheme = 'catppuccin-macchiato',
          after = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi NormalFloat guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Catppuccin mocha',
          colorscheme = 'catppuccin-mocha',
          after = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi NormalFloat guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Rosepine',
          colorscheme = 'rose-pine-main',
          after = [[
            vim.cmd 'hi FloatBorder guibg = Normal'
            vim.cmd 'hi NormalFloat guibg = Normal'
            vim.cmd 'hi FloatTitle guibg = Normal'
          ]],
        },
        {
          name = 'Rosepine Moon',
          colorscheme = 'rose-pine-moon',
        },
      },
    }
  end,
}
