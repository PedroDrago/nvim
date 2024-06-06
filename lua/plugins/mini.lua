return {
  {
    'echasnovski/mini.nvim',
    cond = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = 'MiniFiles', silent = true })
      -- require('mini.files').setup {
      --   -- Customization of shown content
      --   content = {
      --     -- Predicate for which file system entries to show
      --     filter = nil,
      --     -- What prefix to show to the left of file system entry
      --     prefix = nil,
      --     -- In which order to show file system entries
      --     sort = nil,
      --   },
      --
      --   -- Module mappings created only inside explorer.
      --   -- Use `''` (empty string) to not create one.
      --   mappings = {
      --     close = 'q',
      --     go_in = 'l',
      --     go_in_plus = 'L',
      --     go_out = 'h',
      --     go_out_plus = 'H',
      --     reset = '<BS>',
      --     reveal_cwd = '@',
      --     show_help = 'g?',
      --     synchronize = '=',
      --     trim_left = '<',
      --     trim_right = '>',
      --   },
      --
      --   -- General options
      --   options = {
      --     -- Whether to delete permanently or move into module-specific trash
      --     permanent_delete = true,
      --     -- Whether to use for editing directories
      --     use_as_default_explorer = true,
      --   },
      --
      --   -- Customization of explorer windows
      --   windows = {
      --     -- Maximum number of windows to show side by side
      --     max_number = math.huge,
      --     -- Whether to show preview of file/directory under cursor
      --     preview = false,
      --     -- Width of focused window
      --     width_focus = 35,
      --     -- Width of non-focused window
      --     width_nofocus = 35,
      --     -- Width of preview window
      --     width_preview = 100,
      --   },
      -- }
      require('mini.git').setup { n_lines = 500 }
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.move').setup {
        mappings = {
          left = '<Nop>',
          right = '<Nop>',
          down = 'J',
          up = 'K',
          line_left = '<Nop>',
          line_right = '<Nop>',
          line_down = '<Nop>',
          line_up = '<Nop>',
        },
      }
      require('mini.diff').setup {
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '_' },
        },
        delay = {
          text_change = 100, -- 200 was the default
        },
      }
      vim.keymap.set('n', '<leader>df', function()
        MiniDiff.toggle_overlay(0)
      end, { desc = 'Diff View' })
    end,
  },
}
