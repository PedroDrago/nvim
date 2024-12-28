return {
  'folke/noice.nvim',
  cond = false,
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('noice').setup {
      messages = {
        enabled = true,
        view = 'notify', -- default view for messages
        view_error = 'notify', -- view for errors
        view_warn = 'notify', -- view for warnings
        view_history = 'messages', -- view for :messages
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
      routes = {
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = '; before',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = '; after',
        }, opts = { skip = true } },
      },
      cmdline = {
        enabled = false,
        view = 'cmdline_popup',
        opts = {},
        format = {
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = {
            pattern = {
              '^:%s*lua%s+',
              '^:%s*lua%s*=%s*',
              [[ '^:%s*=%s*' ]],
            },
            icon = '',
            lang = 'lua',
          },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
          input = {},
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      lsp = {
        progress = { enabled = false },
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = true,
          silent = false,
          view = nil,
          opts = {},
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
        },
      },
    }
    -- vim.keymap.set('n', '<leader>n', '<cmd>Noice<CR>', { desc = 'Notifications', silent = true })
  end,
}
