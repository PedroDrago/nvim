local diagnostics_enabled = true
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
  diagnostics_enabled = not diagnostics_enabled
  vim.diagnostic.enable(diagnostics_enabled)
end, { desc = 'Toggle LSP Diagnostics On/Off' })
vim.diagnostic.config {
  underline = false,
  update_in_insert = false,
  float = {
    border = 'none',
  },
  virtual_text = {
    spacing = 4,
    -- source = vim.g.linting,
    source = true,
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
