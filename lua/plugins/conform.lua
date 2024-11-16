return {
  'stevearc/conform.nvim',
  cond = true,
  config = function()
    vim.keymap.set('n', '<leader>=', function()
      require('conform').format()
    end)
    local toggle_format_on_save = true
    vim.api.nvim_create_user_command('ToggleFormat', function()
      toggle_format_on_save = not toggle_format_on_save
    end, { desc = 'Toggle Format on Save' })
    require('conform').setup {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = nil,
        c = nil,
        sql = nil,
        cpp = { 'clang-format' },
        -- lua = nil,
        go = { 'gofumpt' },
        markdown = nil, -- explicitly disable conform for filetype
        md = nil,
      },
    }
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        if vim.bo.filetype == 'py' or not toggle_format_on_save then -- Disable format on save per filetype
          return
        end
        local disable_filetypes = { c = true, cpp = true, python = true } -- Disable lsp fallback per filetype
        require('conform').format { bufnr = args.buf, lsp_fallback = not disable_filetypes[vim.bo[args.buf].filetype] }
      end,
    })
  end,
}
