return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      update_focused_file = { enable = true, update_cwd = true },
      git = { ignore = false },
      view = {
        adaptive_size = true,
        -- width = '13%',
      },
    }
  end,
  vim.keymap.set('n', '<leader>e', ':NvimTreeToggle <CR>', { desc = 'Nvim-Tree', silent = true }),
}
