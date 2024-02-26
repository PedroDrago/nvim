return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>m', function()
        vim.api.nvim_command 'echo "File Marked"'
        harpoon:list():append()
      end, { desc = 'Harpoon Mark', silent = true })
      vim.keymap.set('n', '<leader><leader>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon Menu', silent = true })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon 1', silent = true })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon 2', silent = true })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon 3', silent = true })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon 4', silent = true })

      vim.keymap.set('n', '<leader><Tab>', function()
        harpoon:list():next()
      end, { desc = 'Harpoon Next', silent = true })
      vim.keymap.set('n', '<leader><S-Tab>', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon Previous', silent = true })
    end,
  },
}
