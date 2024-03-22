return {
  { 'tpope/vim-sleuth', event = { 'BufReadPost', 'BufNewFile' } },
  {
    'PedroDrago/42header', -- TODO: Remove When finished cube3d? idk
    event = { 'BufReadPost', 'BufNewFile' },
    vim.keymap.set('n', '<F10>', ':Stdheader<CR>', { desc = '42 Header', silent = true }),
  },
  { 'numToStr/Comment.nvim', opts = {}, event = { 'BufReadPost', 'BufNewFile' } },
  { 'farmergreg/vim-lastplace' },
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false }, event = { 'BufReadPost', 'BufNewFile' } },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
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
    'PedroDrago/c_formatter_42.vim', -- TODO: Remove When finished cube3d
    event = { 'BufReadPre', 'BufNewFile' },
    vim.api.nvim_create_user_command('Norm', ':CFormatter42', {}),
  },
}
