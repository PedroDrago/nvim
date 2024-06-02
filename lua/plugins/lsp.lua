return {
  'neovim/nvim-lspconfig',
  cond = true,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = { progress = { display = { done_ttl = 7 } } } },
  },
  config = function()
    vim.keymap.set('n', '<leader>i', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = 'Toggle Inlay Hints', silent = true })
    vim.lsp.set_log_level 'off' -- INFO: Change this to "debug" when needed
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(modes, keys, func, desc)
          vim.keymap.set(modes, keys, func, { buffer = event.buf, desc = desc })
        end
        map('n', 'gd', function()
          require('telescope.builtin').lsp_definitions { reuse_win = false }
        end, 'Go to Definition')
        map('n', 'ga', function()
          require('telescope.builtin').lsp_definitions { reuse_win = false, jump_type = 'vsplit' }
        end, 'Go to Definition in Split')
        map('n', 'gr', require('telescope.builtin').lsp_references, 'References')
        map('n', 'gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('n', 'gS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('n', '<leader>s', vim.lsp.buf.rename, 'Rename')
        map({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, 'Code Action')
        map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        map('n', 'J', vim.diagnostic.open_float, 'Expand Diagnostic')
        map('n', 'S', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('i', '<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    local servers = {
      clangd = {},
      gopls = {
        settings = { -- NOTE: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
          gopls = {
            usePlaceholders = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              unusedparams = false,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
            runtime = { version = 'LuaJIT' },
            codelens = { enabled = true },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
          },
        },
      },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'clangd',
    })
    require('mason').setup {
      ui = {
        border = 'single',
      },
    }
    local lsp = require 'lspconfig'
    lsp.util.default_config = vim.tbl_extend('force', lsp.util.default_config, { -- NOTE: THIS DISABLES SEMANTIC TOKENS, THIS IS SUPOSED TO SPEED UP LSP, BUT MAY BE IS NOT WORTH
      on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup {
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
          }
        end,
      },
    }
  end,
}
