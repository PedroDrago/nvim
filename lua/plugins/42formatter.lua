return {
  'cacharle/c_formatter_42.vim',
  vim.api.nvim_exec2(
    [[
  augroup FormatCOnSave
    autocmd!
    autocmd BufWritePost *.c,*.h :CFormatter42
  augroup END
]],
    {}
  ),
}
