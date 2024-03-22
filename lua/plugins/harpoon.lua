return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      local extensions = require 'harpoon.extensions'
      harpoon:setup {
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      }
      harpoon:extend {
        UI_CREATE = function(cx)
          vim.keymap.set('n', '<C-x>', function()
            harpoon.ui:select_menu_item { vsplit = true }
          end, { buffer = cx.bufnr })
        end,
      }
      -- harpoon:extend(extensions.builtins.command_on_nav ':echo "Navigated"')
      vim.keymap.set('n', '<leader>m', function()
        vim.api.nvim_command 'echo "File Marked"'
        harpoon:list():append()
      end)
      vim.keymap.set('n', '<leader>h', function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), { ui_width_ratio = 0.3 })
      end)

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)
      vim.keymap.set('n', '<leader>w', function()
        harpoon:list():next { ui_nav_wrap = true }
      end)
    end,
  },
}
