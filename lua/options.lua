local opt = vim.opt

opt.background = 'dark'
opt.linebreak = true
opt.number = true --Line Numbers
opt.relativenumber = true -- Relative line Numbers
opt.mouse = 'a' -- Enables mouse on all modes
opt.showmode = false -- Hide mode since I have a status line
opt.clipboard = 'unnamedplus' -- Shares clipboard with OS
opt.undofile = true -- Enable undo files
opt.swapfile = false -- Disable swap files
opt.ignorecase = true -- Ignore case in patterns
opt.smartcase = true -- No ignore case if pattern has uppercase
opt.smartindent = true -- Insert indents automatically
opt.signcolumn = 'yes' -- Enable the column where gitsigns resides
opt.timeoutlen = 500 -- ms to timeout command sequence
opt.updatetime = 250 -- ms to highlight current token
opt.splitright = true -- Vertical split opens by default to the right
opt.splitbelow = true -- Horizontal split opens by default below
opt.inccommand = 'nosplit' -- Real time update on buffer when substituting text
opt.scrolloff = 10 -- Numbers of lines that the screen starts to scroll vertically
opt.hlsearch = true -- Enable Highlight for previous search
opt.termguicolors = true -- Enable 24-bit color in TUI
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.breakindent = true -- Indent wraped line segment

vim.api.nvim_create_autocmd('TextYankPost', { -- Highlights yanked region
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
