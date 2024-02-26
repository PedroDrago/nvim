return {
  'mbbill/undotree',
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { silent = true, desc = 'Undo Tree' }),
  vim.keymap.set('n', '<leader>U', '<cmd>Telescope undo<cr>', { silent = true, desc = 'Undo Tree Telescope' }),
}
