return {
  'stevearc/conform.nvim',
  event = 'VeryLazy',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = false, --disabled just because of 42 norm for C
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'gofmt', 'goimports' }, --this is quite slow, may be disable for formating on save
      python = { 'black' },
      c = {},
      sql = { 'sql-formatter' },
      javascript = { { 'prettierd', 'prettier' } },
      ruby = { 'rubocop' },
    },
  },
  vim.api.nvim_create_user_command('Form', function()
    require('conform').format {}
  end, {}),
  vim.keymap.set('n', '<leader>F', ':Form<CR>', { desc = 'Format', silent = true }),
}
