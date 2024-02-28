return {
  'cacharle/c_formatter_42.vim',
  -- Define autocmd to run :CFormatter42 on BufWritePost for C files
  vim.api.nvim_exec(
    [[
  augroup FormatCOnSave
    autocmd!
    autocmd BufWritePost *.c,*.h :CFormatter42
  augroup END
]],
    false
  ),
}
