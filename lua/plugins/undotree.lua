return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
-- return {
--   'mbbill/undotree',
--   vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { silent = true, desc = 'Undo Tree' }),
--   vim.keymap.set('n', '<leader>U', '<cmd>Telescope undo<cr>', { silent = true, desc = 'Undo Tree Telescope' }),
-- }
