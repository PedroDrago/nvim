return {
  {
    'echasnovski/mini.nvim',
    cond = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.hipatterns').setup { highlighters = { require('mini.hipatterns').gen_highlighter.hex_color() } }
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
      require('mini.files').setup {
        options = {
          use_as_default_explorer = false,
        },
        windows = {
          preview = true,
          width_preview = 50,
        },
      }

      vim.keymap.set('n', '<leader>df', function()
        MiniDiff.toggle_overlay(0)
      end, { desc = 'Diff View' })
      vim.keymap.set('n', '<leader>m', function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = 'Mini Files (Buffer Dir)' })
      vim.keymap.set('n', '<leader>M', function()
        MiniFiles.open(vim.uv.cwd(), true)
      end, { desc = 'Mini Files (Cwd)' })
    end,
  },
  {
    'echasnovski/mini.icons',
    opts = {},
    lazy = true,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
}
