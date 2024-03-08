return {
  { 'tpope/vim-sleuth', event = { 'BufReadPost', 'BufNewFile' } },
  {
    '42Paris/42header', -- TODO: When finished cube3d? idk
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.api.nvim_del_keymap('n', '<F1>')
    end,
  },
  { 'numToStr/Comment.nvim', opts = {}, event = { 'BufReadPost', 'BufNewFile' } },
  { 'farmergreg/vim-lastplace' },
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }, event = { 'BufReadPost', 'BufNewFile' } },
  {
    'szw/vim-maximizer',
    event = { 'BufReadPost', 'BufNewFile' },
    vim.keymap.set('n', '<leader>k', ':MaximizerToggle!<CR>', { desc = 'Maximize Buffer', silent = true }),
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    opts = {
      maximizer_set_default_mapping = 0,
      set_default_mapping = 0,
    },
    config = function()
      require('nvim-ts-autotag').setup {
        maximizer_set_default_mapping = 0,
        set_default_mapping = 0,
      }
    end,
  },
  {
    -- 'cacharle/c_formatter_42.vim',
    'PedroDrago/c_formatter_42.vim', -- TODO: When finished cube3d
    vim.api.nvim_create_user_command('Norm', ':CFormatter42', {}),
  },
}
