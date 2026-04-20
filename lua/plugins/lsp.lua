return {
  'neovim/nvim-lspconfig',
  cond = true,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',
    { 'j-hui/fidget.nvim', opts = { progress = { display = { done_ttl = 7 } }, notification = { window = { winblend = 0 } } } },
  },
  config = function()
    local fzf = require 'fzf-lua'
    local fzf_actions = require 'fzf-lua.actions'

    vim.keymap.set('n', '<leader>i', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
    end, { desc = 'Toggle Inlay Hints', silent = true })
    vim.lsp.log.set_level 'off' -- INFO: Change this to "debug" when needed
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(modes, keys, func, desc)
          vim.keymap.set(modes, keys, func, { buffer = event.buf, desc = desc })
        end
        map('n', 'gd', function()
          fzf.lsp_definitions()
        end, 'Go to Definition')
        map('n', 'ga', function()
          fzf.lsp_definitions {
            jump1_action = fzf_actions.file_vsplit,
            actions = {
              ['enter'] = fzf_actions.file_vsplit,
            },
          }
        end, 'Go to Definition in Split')
        map('n', 'gr', fzf.lsp_references, 'References')
        map('n', 'gs', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('n', 'gS', fzf.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
        map('n', '<leader>s', vim.lsp.buf.rename, 'Rename')
        map({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, 'Code Action')
        map('n', '<leader>D', fzf.lsp_typedefs, 'Type [D]efinition')
        map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        map('n', 'H', vim.diagnostic.open_float, 'Expand Diagnostic')
        map('n', 'S', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('i', '<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
    })
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    local servers = {
      clangd = {},
      ty = {},
      rust_analyzer = {},
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
    local mason_lsp_servers = vim.tbl_keys(servers)
    local mason_tools = {
      'stylua',
    }

    -- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
    for server_name, config in pairs(servers) do
      vim.lsp.config(server_name, config)
    end

    require('mason').setup {
      ui = {
        border = 'single',
      },
    }

    require('mason-lspconfig').setup {
      ensure_installed = mason_lsp_servers,
    }
    require('mason-tool-installer').setup { ensure_installed = mason_tools }

    for server_name in pairs(servers) do
      vim.lsp.enable(server_name)
    end
  end,
}
