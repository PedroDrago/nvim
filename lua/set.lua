vim.loader.enable()
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.swapfile = false
vim.opt.number = true
vim.o.wrap = false
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 500
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'nosplit'
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.cursorline = false
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = '80'

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
