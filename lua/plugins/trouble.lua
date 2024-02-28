return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {},
  vim.keymap.set('n', '<leader>z', function()
    require('trouble').toggle()
  end, { silent = true, desc = 'Trouble Project' }),
}
