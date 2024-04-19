return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofumpt' },
        markdown = nil, -- explicitly disable conform for filetype
        md = nil,
      },
    }
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        if vim.bo.filetype == '' then -- Disable format on save per filetype
          return
        end
        local disable_filetypes = { c = true, cpp = true } -- Disable lsp fallback per filetype
        require('conform').format { bufnr = args.buf, lsp_fallback = not disable_filetypes[vim.bo[args.buf].filetype] }
      end,
    })
    vim.keymap.set('n', '<leader>p', function()
      require('conform').format { async = true, lsp_fallback = true }
    end, { desc = 'Format' })
  end,
}
