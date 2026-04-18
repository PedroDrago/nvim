return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  cond = true,
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'

    ts.setup {
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }

    local group = vim.api.nvim_create_augroup('dotfiles_treesitter_start', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      callback = function(args)
        pcall(vim.treesitter.start, args.buf, args.match)
      end,
    })
  end,
}
