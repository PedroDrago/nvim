require 'globals'
require 'options'
require 'keymaps'
require 'diagnostics'
require 'autocmds'
require 'colorscheme'
require 'lazyvim'

vim.keymap.set('n', '<leader>0', function ()
  vim.g.tree = not vim.g.tree
end, { desc = 'Description', silent = true })

-- vim: ts=2 sts=2 sw=2
