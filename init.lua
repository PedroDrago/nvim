vim.loader.enable()
local g = vim.g
local opt = vim.opt
local keymap = vim.keymap.set

-------------------------Globals-------------------------------
g.mapleader = ' '
g.maplocalleader = ' '
g.linting = false
-- NOTE: This idea to trigger colorschemes with this globals if for keep unused themes unloaded, saving memory and loadtime (yeah I know it won't make any real difference). But I don't know, it botters me, need to think in a better way to manage colorschemes.
g.tokyonight = true
g.gruvbox = false
g.catppuccin = false
g.rosepine = false
g.onedark = false
g.oxocarbon = false

-------------------------------Options-------------------------
opt.background = 'dark'
opt.linebreak = true
opt.number = true --Line Numbers
opt.relativenumber = true -- Relative line Numbers
opt.mouse = 'ivc' -- Enables mouse on all modes
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

-------------------------Keymaps-----------------------------------

-- Disables
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Reset Space' })
keymap('n', '<C-z>', '<nop>', { desc = 'Disable suspending Vim' })

-- Panels
keymap('n', '<leader>a', '<cmd>vsplit <CR><cmd>set rnu<CR>', { desc = 'Vertical Split' })
keymap('n', '<leader>A', '<cmd>split <CR><cmd>set rnu<CR>', { desc = 'Horizontal Split' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Close Buffer' })
keymap({ 'n', 'i' }, '<C-h>', '<C-w><C-h>', { desc = 'Move left ' })
keymap({ 'n', 'i' }, '<C-l>', '<C-w><C-l>', { desc = 'Move right ' })
keymap({ 'n', 'i' }, '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
keymap({ 'n', 'i' }, '<C-k>', '<C-w><C-k>', { desc = 'Move up' })
keymap('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Panels' })
keymap('n', '<leader>v', '<cmd>wincmd J<CR>', { desc = 'Verticalize Panels' })
keymap('n', '<leader>V', '<cmd>wincmd L<CR>', { desc = 'Horizontalize Panels' })
keymap('n', '<leader>=', '<C-w><C-=>', { desc = 'Equalize Panels' })

-- Terminal
keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<leader>T', '<cmd>vsplit | setlocal nonumber | setlocal norelativenumber | setlocal scl=no | terminal<CR>a', { desc = 'Vertical Terminal' })
keymap('n', '<leader>t', '<cmd>botright split | horizontal resize -10 | terminal<CR>', { desc = 'Horizontal Terminal' })

-- Misc
keymap('n', '<leader>r', [[:%s/<C-r><C-w>//g<Left><Left>]], { desc = 'Rename Word' })
keymap('v', '<leader>s', [[:s///g<Left><Left><Left>]], { desc = 'Rename Word In Selected Region' })
keymap('n', '<F1>', '<cmd>Alpha<CR>', { desc = 'Macro Recording' })
-- keymap('n', 'qq', 'q', { desc = 'Macro Recording' })
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Center when Scroll Page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Center when Scroll Page' })
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Quit Search' })
keymap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Void Delete' })
-- keymap('n', '<C-a>', 'ggVG', { desc = 'Select All' })

keymap('v', '<', '<gv', { noremap = true, silent = true })
keymap('v', '>', '>gv', { noremap = true, silent = true })
keymap('v', '<Tab>', '>gv', { desc = 'Indent Right' })
keymap('v', '<S-Tab>', '<gv', { desc = 'Indent Left' })
keymap('x', 'p', [[<Cmd>silent! normal! "_dP<CR>]], { noremap = true, silent = true }) -- NOTE: QOL keymap for pasting in visual mode

keymap('n', 'j', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true, desc = 'Add jumps to jumplist' })
keymap('n', 'k', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true, desc = 'Add jumps to jumplist' })
------------------ diagnostics-----------------------------
local diagnostics_enabled = true
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
  diagnostics_enabled = not diagnostics_enabled
  vim.diagnostic.enable(diagnostics_enabled)
end, { desc = 'Toggle LSP Diagnostics On/Off' })
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  float = {
    border = 'none',
  },
  virtual_text = {
    spacing = 4,
    source = vim.g.linting,
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return ' '
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return ' '
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return ' '
      else -- HINT
        return ' '
      end
    end,
  },
  severity_sort = true,
  inlay_hints = { enabled = true },
  codelens = { enabled = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.HINT] = 'HintMsg', -- FIX: Not working
      [vim.diagnostic.severity.INFO] = 'InfoMsg', -- FIX: Not working
    },
  },
}

---------------------autocmds----------------------------
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

create_autocmd('TermOpen', {
  desc = 'Setup Terminal Options',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scl = 'no'
    vim.cmd.startinsert()
  end,
})

---------------------lazy---------------------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  change_detection = { notify = false },
}
-- vim: ts=2 sts=2 sw=2
