return {
  'hrsh7th/nvim-cmp',
  cond = true,
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp_enabled = true
    vim.api.nvim_create_user_command('CmpToggle', function()
      if cmp_enabled then
        require('cmp').setup { enabled = false }
        cmp_enabled = false
        vim.cmd 'echo "Autocomplete Off"'
      else
        require('cmp').setup { enabled = true }
        cmp_enabled = true
        vim.cmd 'echo "Autocomplete On"'
      end
    end, { desc = 'Toggle Autocompletion On/Off' })
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    cmp.setup {
      window = {
        completion = cmp.config.window.bordered {
          scrollbar = false,
        },
      },
      experimental = {
        ghost_text = false,
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          menu = {
            nvim_lsp = '',
            luasnip = '',
            nvim_lsp_signature_help = '',
            path = '',
            buffer = '',
          },
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mode = 'symbol_text',
      completion = { completeopt = 'menu,menuone,noinsert' },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert {
        -- TODO: Find ideal mapping for confirming completion (confortable on any setup/keyboard and works on every terminal existent)
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Enter>'] = cmp.mapping.confirm { select = true },
        ['<C-CR>'] = cmp.mapping.confirm { select = true },
        ['<C-Return>'] = cmp.mapping.confirm { select = true },

        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp', max_item_count = 30 },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
