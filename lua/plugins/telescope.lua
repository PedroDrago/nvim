return {
  'nvim-telescope/telescope.nvim',
  cond = true,
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
        preview = {
          treesitter = true, -- WARN: This lags a lot in large files
        },
        file_ignore_patterns = { '.git/', '.cache', '%.o', '%.a', '%.out', '%.pdf', '%.mkv', '%.mp4', '%.zip', 'node%_modules/.*' },
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
        colorscheme = { enable_preview = true },
        live_grep = {
          additional_args = { '--fixed-strings' },
        },
        -- grep_string = {
        --   additional_args = { '--fixed-strings' },
        -- },
        find_files = {
          find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        },
        buffers = {
          mappings = {
            i = {
              ['<c-d>'] = actions.delete_buffer,
            },
          },
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
    vim.keymap.set('n', '<leader>g', builtin.grep_string, { desc = 'Search Word' })
    vim.keymap.set('n', '<leader>?', builtin.builtin, { desc = 'Search Pickers' })
    vim.keymap.set('n', '<leader>/', function()
      builtin.live_grep {
        prompt_title = 'Grep',
      }
    end, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>b', function()
      builtin.buffers(require('telescope.themes').get_dropdown {
        -- winblend = 10,
        previewer = false,
      })
    end, { desc = 'Search Buffers' })
  end,
}
