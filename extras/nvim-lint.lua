return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      go = { 'golangcilint' },
      c = { 'clangtidy' },
      cpp = { 'cpplint' },
    }
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
