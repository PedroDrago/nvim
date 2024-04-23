return {
  'nyoom-engineering/oxocarbon.nvim',
  cond = vim.g.oxocarbon,
  priority = 1000,
  opts = {},
  config = function() end,
  init = function()
    vim.cmd.colorscheme 'oxocarbon'
  end,
}
