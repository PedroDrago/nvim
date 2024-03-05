return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    config = function()
      if vim.g.theme_id == 1 then
        vim.api.nvim_set_hl(0, 'OilGitStatusSignColumnGroup', { bg = '#16161E' })
      elseif vim.g.theme_id == 2 then
        vim.api.nvim_set_hl(0, 'OilGitStatusSignColumnGroup', { bg = '#24283B' })
      end
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
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = 'actions.select_vsplit',
          ['<C-h>'] = '<C-w><C-h>',
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['<C-l>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
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
  {
    'refractalize/oil-git-status.nvim',

    dependencies = {
      'stevearc/oil.nvim',
    },
    opts = {
      show_ignored = false,
    },
    config = true,
    default = true,
  },
}
