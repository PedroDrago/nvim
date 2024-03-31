return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- go = { 'gofmt', 'goimports' },
      },
    }
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        if vim.bo.filetype == 'c' then -- Disable format on save
          return
        end
        local disable_filetypes = { c = true, cpp = true } -- Disable lsp_fallback
        require('conform').format { bufnr = args.buf, lsp_fallback = not disable_filetypes[vim.bo[args.buf].filetype] }
      end,
    })
    vim.api.nvim_create_user_command('Format', function()
      require('conform').format {}
    end, {})
    vim.keymap.set('n', '<leader>p', ':Format<CR>', { desc = 'Format', silent = true })
  end,
}
