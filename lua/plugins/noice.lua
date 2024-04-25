return {
  'folke/noice.nvim',
  cond = true,
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    -- 'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      routes = {
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'line less',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'more line',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'more line',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'yanked',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'fewer lines',
        }, opts = { skip = true } },
        { filter = {
          event = 'msg_show',
          kind = '',
          find = 'change',
        }, opts = { skip = true } },
      },
      cmdline = {
        enabled = true,
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
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
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
          -- TODO: Try to apply focusable = false to noice hover. Maybe someday we'll have an answer in this [issue](https://github.com/folke/noice.nvim/issues/698)
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
  end,
}
