return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'folke/neodev.nvim', opts = {} },
    { 'j-hui/fidget.nvim', opts = { progress = { display = { done_ttl = 7 } } } },
  },
  config = function()
    -- SECTION: Diagnostic Toggle Function
    local diagnostics_enabled = true
    vim.api.nvim_create_user_command('DiagnosticsToggle', function()
      if diagnostics_enabled then
        vim.diagnostic.disable()
        diagnostics_enabled = false
        vim.cmd 'echo "Diagnostics Off"'
      else
        vim.diagnostic.enable()
        diagnostics_enabled = true
        vim.cmd 'echo "Diagnostics On"'
      end
    end, { desc = 'Toggle LSP Diagnostics On/Off' })
    -- SECTION: Diagnostics Config
    vim.diagnostic.config { -- :h vim.diagnostic.config
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = false, -- TODO: change this to a function -> if global variable linting then 'if_many' else false
        prefix = function(diagnostic)
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return ' '
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            return ' '
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            return ' '
          else -- HINT
            return ' '
          end
        end,
      },
      severity_sort = true,
      inlay_hints = { enabled = true },
      codelens = { enabled = true },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '',
          [vim.diagnostic.severity.INFO] = '',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          [vim.diagnostic.severity.WARN] = 'WarningMsg',
          [vim.diagnostic.severity.HINT] = 'HintMsg', -- FIX: Not working
          [vim.diagnostic.severity.INFO] = 'InfoMsg', -- FIX: Not working
        },
      },
    }
    -- SECTION: General LSP Tools on attach
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end
        local vmap = function(keys, func, desc)
          vim.keymap.set({ 'n', 'v' }, keys, func, { buffer = event.buf, desc = desc })
        end
        map('gd', function()
          require('telescope.builtin').lsp_definitions { reuse_win = false }
        end, 'Go to Definition')
        map('gr', require('telescope.builtin').lsp_references, 'References')
        map('gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('gS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>s', vim.lsp.buf.rename, 'Rename') -- vim.cmd '[[:%s/<C-r><C-w>//g<Left><Left>]]' NOTE: Regex alternative.
        vmap('<leader>c', vim.lsp.buf.code_action, 'Code Action')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('J', vim.diagnostic.open_float, 'Expand Diagnostic')
        map('S', vim.lsp.buf.signature_help, 'Signature Documentation') --maybe H is better
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

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
    -- SECTION: Language Servers Individual Configurations
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    local servers = {
      clangd = {},
      gopls = {
        settings = {
          gopls = {
            hints = { enabled = true },
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            hint = { enabled = true },
            runtime = { version = 'LuaJIT' },
            codelens = { enabled = true },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }
    -- SECTION: Mason
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })
    require('mason').setup()
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
