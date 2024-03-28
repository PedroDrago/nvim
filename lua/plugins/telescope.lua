return {
  'nvim-telescope/telescope.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    local actions = require 'telescope.actions'
    require('telescope').setup {
      defaults = {
        selection_caret = ' ',
        entry_prefix = ' ',
        prompt_prefix = '',
        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>g', builtin.grep_string, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>?', builtin.builtin, { desc = 'Search Pickers' })
  end,
}

-- NOTE: apparently fzf.lua by itself is very faster than telescope, but maybe that can only be
-- perceived in larger codebases.
