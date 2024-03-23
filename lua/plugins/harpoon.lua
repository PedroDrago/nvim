return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }
    vim.keymap.set('n', '<leader>m', function()
      vim.api.nvim_command 'echo "File Marked"'
      harpoon:list():append()
    end, { desc = 'Harpoon Mark' })
    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), { ui_width_ratio = 0.3, ui_nav_wrap = true })
    end, { desc = 'Harpoon Menu' })
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon Jump 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon Jump 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon Jump 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon Jump 4' })
    vim.keymap.set('n', '<leader>w', function()
      harpoon:list():next { ui_nav_wrap = true }
    end, { desc = 'Harpoon Next' })
  end,
}
-- TODO: nav_wrap not working on first list():next, only on second call.
-- Only load harpoon with keymaps
