return {
  {
    'echasnovski/mini.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()
    end,
  },
  -- {
  --   'echasnovski/mini.pairs',
  --   event = 'VeryLazy',
  --   opts = {},
  --   keys = {
  --     {
  --       '<leader>p',
  --       function()
  --         local Util = require 'lazy.core.util'
  --         vim.g.minipairs_disable = not vim.g.minipairs_disable
  --         if vim.g.minipairs_disable then
  --           Util.warn('Disabled auto pairs', { title = 'Option' })
  --         else
  --           Util.info('Enabled auto pairs', { title = 'Option' })
  --         end
  --       end,
  --       desc = 'Toggle auto pairs',
  --     },
  --   },
  -- },
}
