vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(modes, keys, func, desc)
      vim.keymap.set(modes, keys, func, { buffer = event.buf, desc = desc })
    end
    map('n', 'gd', function()
      require('telescope.builtin').lsp_definitions { reuse_win = false }
    end, 'Go to Definition')
    map('n', 'gr', require('telescope.builtin').lsp_references, 'References')
    map('n', 'gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('n', 'gS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('n', '<leader>s', vim.lsp.buf.rename, 'Rename')
    map({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, 'Code Action')
    map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
    map('n', 'J', vim.diagnostic.open_float, 'Expand Diagnostic')
    map('n', 'S', vim.lsp.buf.signature_help, 'Signature Documentation')
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
