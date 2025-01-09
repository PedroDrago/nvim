return {
  -- DOC: https://cmp.saghen.dev/
  'saghen/blink.cmp',
  version = '*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
      menu = {
        -- auto_show = function(ctx)
        -- return ctx.mode ~= 'cmdline'
        -- end,
        draw = {
          columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
          components = {
            item_idx = {
              text = function(ctx)
                return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx)
              end,
              highlight = 'BlinkCmpItemIdx',
            },
          },
        },
      },
    },
    keymap = {
      preset = 'default',
      ['<C-j>'] = { 'select_next' },
      ['<C-n>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
      ['<C-p>'] = { 'select_prev' },
      ['<C-y>'] = { 'accept' },
      ['<C-i>'] = { 'accept' },
      ['<C-CR>'] = { 'accept' },
      ['<C-c>'] = { 'hide' },
      ['<C-h>'] = { 'snippet_backward' },
      ['<C-l>'] = { 'snippet_forward' },
      ['<C-x>'] = { 'hide_documentation' },
      ['<Tab>'] = {},
      ['<C-z>'] = { 'show_documentation' },
      ['<C-1>'] = {
        function(cmp)
          cmp.accept { index = 1 }
        end,
      },
      ['<C-2>'] = {
        function(cmp)
          cmp.accept { index = 2 }
        end,
      },
      ['<C-3>'] = {
        function(cmp)
          cmp.accept { index = 3 }
        end,
      },
      ['<C-4>'] = {
        function(cmp)
          cmp.accept { index = 4 }
        end,
      },
      ['<C-5>'] = {
        function(cmp)
          cmp.accept { index = 5 }
        end,
      },
      ['<C-6>'] = {
        function(cmp)
          cmp.accept { index = 6 }
        end,
      },
      ['<C-7>'] = {
        function(cmp)
          cmp.accept { index = 7 }
        end,
      },
      ['<C-8>'] = {
        function(cmp)
          cmp.accept { index = 8 }
        end,
      },
      ['<C-9>'] = {
        function(cmp)
          cmp.accept { index = 9 }
        end,
      },
      ['<C-0>'] = {
        function(cmp)
          cmp.accept { index = 10 }
        end,
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    snippets = {
      preset = 'luasnip',

      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { 'sources.default' },
}
