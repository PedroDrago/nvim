return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        win_options = {
          wrap = false,
          cursorcolumn = false,
          foldcolumn = '0',
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = 'nvic',
        },
        float = {
          padding = 2,
          max_width = 80,
          max_height = 35,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
        },
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    vim.keymap.set('n', '<leader>e', function()
      require('oil').toggle_float()
    end, { desc = 'Oil Float', silent = true }),
  },
}
