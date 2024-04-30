-- NOTE: Inspiration from [https://github.com/Abstract-IDE/abstract-autocmds](abstract-autocmds)

local group = vim.api.nvim_create_augroup('MyAuGroup', { clear = true })

local function create_autocmd(events, opts)
  opts = vim.tbl_extend('force', opts, { group = group })
  vim.api.nvim_create_autocmd(events, opts)
end

create_autocmd('VimResized', {
  desc = 'auto resize splited windows',
  pattern = '*',
  command = 'tabdo wincmd =',
})

create_autocmd('BufWinEnter', {
  desc = 'jump to the last position when reopening a file',
  pattern = '*',
  command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

create_autocmd({ 'BufEnter', 'FileType' }, {
  desc = "don't auto comment new line",
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

create_autocmd('FileType', {
  desc = "don't auto comment new line",
  pattern = 'cpp',
  command = 'setlocal shiftwidth=4',
})
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlights yanked region',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
