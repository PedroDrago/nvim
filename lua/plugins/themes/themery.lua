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
          -- before = [[
          --   local colors = {
          --     border = 'none', -- NOTE:  Unbordered Dark bg
          --     -- winhighlight = 'Normal:Pmenu,FloatBorder:Normal',
          --
          --     -- border = 'rounded', --  NOTE: Bordered Dark bg
          --     winhighlight = 'Normal:Pmenu',
          --   }
          --   local cmp = require 'cmp'
          --   cmp.setup {
          --     window = {
          --       documentation = cmp.config.window.bordered {
          --         border = colors.border,
          --         winhighlight = colors.winhighlight,
          --       },
          --       completion = cmp.config.window.bordered {
          --         border = colors.border,
          --         winhighlight = colors.winhighlight,
          --         scrollbar = false,
          --       },
          --     },
          --   }
          -- ]],
        },
        {
          name = 'Tokyonight Storm',
          colorscheme = 'tokyonight-storm',
          -- before = [[
          --   local colors = {
          --     border = 'none', -- NOTE:  Unbordered Dark bg
          --     -- winhighlight = 'Normal:Pmenu,FloatBorder:Normal',
          --
          --     -- border = 'rounded', --  NOTE: Bordered Dark bg
          --     winhighlight = 'Normal:Pmenu',
          --   }
          --   local cmp = require 'cmp'
          --   cmp.setup {
          --     window = {
          --       documentation = cmp.config.window.bordered {
          --         border = colors.border,
          --         winhighlight = colors.winhighlight,
          --       },
          --       completion = cmp.config.window.bordered {
          --         border = colors.border,
          --         winhighlight = colors.winhighlight,
          --         scrollbar = false,
          --       },
          --     },
          --   }
          -- ]],
        },
        {
          name = 'Gruvbox',
          colorscheme = 'gruvbox-material',
          before = [[ 
          local colors = {
            -- border = 'none', --  NOTE: No border | bg different than bg
            -- winhighlight = 'Normal:Pmenu',

            border = 'rounded', --  NOTE: thin border | bg equal to bg.
            winhighlight = 'Normal:Normal,FloatBorder:Normal',
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
          -- after = [[
          --   vim.cmd 'hi FloatBorder guibg = Normal'
          --   vim.cmd 'hi NormalFloat guibg = Normal'
          --   vim.cmd 'hi FloatTitle guibg = Normal'
          -- ]],
        },
        {
          name = 'Catppuccin macchiato',
          colorscheme = 'catppuccin-macchiato',
          -- after = [[
          --   vim.cmd 'hi FloatBorder guibg = Normal'
          --   vim.cmd 'hi NormalFloat guibg = Normal'
          --   vim.cmd 'hi FloatTitle guibg = Normal'
          -- ]],
        },
        {
          name = 'Catppuccin mocha',
          colorscheme = 'catppuccin-mocha',
          -- after = [[
          --   vim.cmd 'hi FloatBorder guibg = Normal'
          --   vim.cmd 'hi NormalFloat guibg = Normal'
          --   vim.cmd 'hi FloatTitle guibg = Normal'
          -- ]],
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
