return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', ':UndotreeToggle<CR>', desc = 'Undo Tree', silent = true },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 15
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_DiffCommand = 'diff --color'
  end,
}
