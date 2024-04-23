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
vim.diagnostic.config { -- :h vim.diagnostic.config
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = vim.g.linting,
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
