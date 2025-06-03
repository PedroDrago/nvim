local opt = vim.opt

opt.lazyredraw = false -- Testing if improves performance
opt.background = 'dark'
opt.linebreak = true
opt.number = true --Line Numbers
opt.relativenumber = true -- Relative line Numbers
-- opt.mouse = 'ivc' -- Enables mouse on all modes
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
opt.smoothscroll = true
opt.cmdheight = 0 -- set to 0 to hide the command bar (only if noice is disabled)

-- Indentation
opt.tabstop = 4 -- A TAB character looks like 4 spaces (8 is neovim default)
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
opt.shiftwidth = 4 -- Number of spaces inserted when indenting
opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
opt.laststatus = 3
