return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = false, --disabled just because of 42 norm for C
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports', 'gofmt' },
      python = { 'black' },
      c = {},
      javascript = { { 'prettierd', 'prettier' } },
    },
  },
}
