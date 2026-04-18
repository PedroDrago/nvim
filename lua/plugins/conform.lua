return {
  'stevearc/conform.nvim',
  cond = true,
  config = function()
    local format_on_save = true

    vim.keymap.set('n', '<leader>=', function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end, { desc = 'Format Buffer' })

    vim.api.nvim_create_user_command('ToggleFormat', function()
      format_on_save = not format_on_save
    end, { desc = 'Toggle Format on Save' })

    require('conform').setup {
      notify_on_error = false,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        python = nil,
        c = nil,
        sql = nil,
        cpp = { 'clang-format' },
        go = { 'gofumpt' },
        markdown = nil, -- explicitly disable conform for filetype
        md = nil,
      },
      format_on_save = function(bufnr)
        if not format_on_save then
          return nil
        end

        local filetype = vim.bo[bufnr].filetype
        if filetype == 'python' or filetype == 'cpp' then
          return nil
        end

        local disable_lsp_fallback = {
          c = true,
          cpp = true,
          python = true,
        }

        return {
          bufnr = bufnr,
          timeout_ms = 500,
          lsp_format = disable_lsp_fallback[filetype] and 'never' or 'fallback',
        }
      end,
    }
  end,
}
