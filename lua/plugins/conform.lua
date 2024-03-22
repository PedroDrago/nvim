return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'gofmt', 'goimports' }, --this is quite slow, may be disable for formating on save
      python = { 'black' },
      sql = { 'sql-formatter' },
      javascript = { { 'prettierd', 'prettier' } },
      ruby = { 'rubocop' },
    },
  },
  vim.api.nvim_create_user_command('Format', function()
    require('conform').format {}
  end, {}),
  vim.keymap.set('n', '<leader>p', ':Format<CR>', { desc = 'Format', silent = true }),
}
