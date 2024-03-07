return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-cmdline',
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp_enabled = true
    vim.api.nvim_create_user_command('ToggleAutoComplete', function()
      if cmp_enabled then
        require('cmp').setup.buffer { enabled = false }
        cmp_enabled = false
        vim.api.nvim_command 'echo "Autocomplete Off"'
      else
        require('cmp').setup.buffer { enabled = true }
        cmp_enabled = true
        vim.api.nvim_command 'echo "Autocomplete On"'
      end
    end, {})
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    luasnip.config.setup {}
    cmp.setup {
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Enter>'] = cmp.mapping.confirm { select = true },
        -- ['<C-Space>'] = cmp.mapping.complete {},
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
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      },
    }
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline {
        vim.keymap.set('c', '<C-j>', cmp.mapping.select_next_item(), { desc = 'Move down' }),
        vim.keymap.set('c', '<C-k>', cmp.mapping.select_prev_item(), { desc = 'Move down' }),
        vim.keymap.set('c', '<C-Enter>', cmp.mapping.confirm(), { desc = 'Move down' }),
      },
      sources = {
        { name = 'buffer' },
      },
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })
  end,
}
