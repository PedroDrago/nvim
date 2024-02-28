return {
  'echasnovski/mini.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()
  end,
}
