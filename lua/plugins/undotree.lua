return {
  'mbbill/undotree',
  cond = true,
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
  },
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 15
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffCommand = 'diff --color'
  end,
}
