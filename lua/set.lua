vim.loader.enable() -- Enable experimental neovim loader (may have better startup time)
vim.g.mapleader = ' ' -- Set space as leader key
vim.g.maplocalleader = ' ' -- Set space as leader key

vim.opt.number = true --Line Numbers
vim.opt.relativenumber = true -- Relative line Numbers
vim.opt.wrap = false -- Wraps long lines
vim.opt.mouse = 'a' -- Enables mouse on all modes
vim.opt.showmode = false -- Hide mode since I have a status line
vim.opt.clipboard = 'unnamedplus' -- Shares clipboard with OS
vim.opt.undofile = true -- Enable undo files
vim.opt.swapfile = false -- Disable swap files
vim.opt.ignorecase = true -- Ignore case in patterns
vim.opt.smartcase = true -- No ignore case if pattern has uppercase
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.signcolumn = 'yes' -- Enable the column where gitsigns resides
vim.opt.timeoutlen = 500 -- ms to timeout command sequence
vim.opt.updatetime = 250 -- ms to highlight current token
vim.opt.splitright = true -- Vertical split opens by default to the right
vim.opt.splitbelow = true -- Horizontal split opens by default below
vim.opt.inccommand = 'nosplit' -- Real time update on buffer when substituting text
vim.opt.scrolloff = 10 -- Numbers of lines that the screen starts to scroll vertically
vim.opt.hlsearch = true -- Enable Highlight for previous search
vim.opt.termguicolors = true -- Enable 24-bit color in TUI
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions

vim.api.nvim_create_autocmd('TextYankPost', { -- Highlights yanked region
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
