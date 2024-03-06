return {
  'ThePrimeagen/harpoon',
  lazy = true,
  vim.keymap.set('n', '<leader><Tab>', function()
    require('harpoon.ui').nav_next()
  end, { desc = 'Harpoon next', silent = true }),
  vim.keymap.set('n', '<leader><leader>', function()
    require('harpoon.ui').toggle_quick_menu()
  end, { desc = 'Harpoon Menu', silent = true }),
  vim.keymap.set('n', '<leader>m', function()
    vim.api.nvim_command 'echo "File Marked"'
    require('harpoon.mark').add_file()
  end, { desc = 'Harpoon Mark', silent = true }),
  vim.keymap.set('n', '<leader>1', function()
    require('harpoon.ui').nav_file(1)
  end, { desc = 'Harpoon 1', silent = true }),
  vim.keymap.set('n', '<leader>2', function()
    require('harpoon.ui').nav_file(2)
  end, { desc = 'Harpoon 2', silent = true }),
  vim.keymap.set('n', '<leader>3', function()
    require('harpoon.ui').nav_file(3)
  end, { desc = 'Harpoon 3', silent = true }),
  vim.keymap.set('n', '<leader>4', function()
    require('harpoon.ui').nav_file(4)
  end, { desc = 'Harpoon 4', silent = true }),
}
