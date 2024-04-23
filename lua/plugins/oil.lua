return {
  'stevearc/oil.nvim',
  cond = true,
  tag = 'v2.8.0', -- BUG: Remove when [Issue](https://github.com/stevearc/oil.nvim/issues/355) has been resolved.
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
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = '<C-w><C-h>',
        ['<C-l>'] = '<C-w><C-l>',
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
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
  end, { desc = 'Oil Float' }),
  vim.keymap.set('n', '<leader>E', '<CMD>Oil<CR>', { desc = 'Oil Buffer' }),
}
