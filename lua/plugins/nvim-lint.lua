return {
  'mfussenegger/nvim-lint',
  keys = {
    {
      '<leader>l',
      function()
        require('lint').try_lint()
      end,
      desc = 'lint',
    },
  },
  config = function()
    require('lint').linters_by_ft = {
      -- c = { 'cpplint' },
      go = { 'golangcilint' },
      ruby = { 'rubocop' },
    }
  end,
}
-- FIX:The automatic_installation setting ensures that all linters specified in the config of nvim-lint
--are installed, so you need just specify linters in the nvim-lint. However, when the linter you need
--is not available in the nvim-lint, then you can specify all required linters in the ensure_installed
--in the mason's registry format, and then they will be installed from the registry. You fixed the error
--by providing the linter name in the mason's registry format as it should be.
