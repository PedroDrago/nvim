return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = true,
  opts = {
    window = {
      winblend = 0,
    },
  },
  keys = {
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Undo Tree', silent = true },
  },
}
