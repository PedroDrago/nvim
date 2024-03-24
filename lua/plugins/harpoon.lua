return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>m',
      function()
        vim.api.nvim_command 'echo "File Marked"'
        require('harpoon'):list():append()
      end,
      desc = 'Harpoon Mark',
    },
    {
      '<leader>h',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list(), { ui_width_ratio = 0.3, ui_nav_wrap = true })
      end,
      desc = 'Harpoon Menu',
    },
    {
      '<leader>w',
      function()
        require('harpoon'):list():next { ui_nav_wrap = true }
      end,
      desc = 'Harpoon Next',
    },
    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon Jump 1',
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon Jump 2',
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon Jump 3',
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon Jump 4',
    },
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }
  end,
}
-- TODO: nav_wrap not working on first list():next, only on second call.
-- Only load harpoon with keymaps
