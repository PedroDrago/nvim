return {
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      -- vim.api.nvim_set_hl(0, 'OilGitStatusSignColumnGroup', { bg = '#16161E' })
      -- vim.api.nvim_set_hl(0, 'OilGitStatusSignColumnGroup', { bg = '#24283B' })
      require('oil').setup {
        win_options = {
          wrap = false,
          signcolumn = 'yes:2',
          cursorcolumn = false,
          foldcolumn = '0',
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = 'nvic',
          winhl = 'SignColumn:OilGitStatusSignColumnGroup',
        },
        float = {
          padding = 2,
          max_width = 100,
          max_height = 40,
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
