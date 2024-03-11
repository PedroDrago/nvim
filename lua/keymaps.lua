vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--Splits
vim.keymap.set('n', '<leader>w', ':wincmd w<CR>', { desc = 'Move focus to next window', silent = true })
vim.keymap.set('n', '<leader>a', ':vnew <CR>', { desc = 'Split', silent = true })
vim.keymap.set('n', '<leader>=', ':wincmd =<CR>', { desc = 'Equalize Buffers', silent = true })
vim.keymap.set('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Splits', silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move left ' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move right ' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move up' })

--Function Navigation
vim.keymap.set('n', '{', '[m', { desc = 'Next Function', silent = true })
vim.keymap.set('n', '}', ']m', { desc = 'Previous Function', silent = true })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>t', ':terminal<CR>:set nonumber<CR>:set norelativenumber<CR>:set scl=no<CR>a', { desc = 'Open Vertical Terminal', silent = true })

vim.keymap.set(
  'n',
  '<leader>T',
  ':split | res 9 | terminal<CR>:set nonumber<CR>:set norelativenumber<CR>:set scl=no<CR>a',
  { desc = 'Open Vertical Terminal', silent = true }
)

-- Better default experience
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Quit Search' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Macro' })
vim.keymap.set('n', 'q', '<nop>', { desc = 'Disable Macro' })
vim.keymap.set('n', '<C-o>', '<nop>', { desc = 'Disable Macro' })
vim.cmd 'cabbrev Q q'
vim.cmd 'cabbrev Qa qa'
vim.cmd 'cabbrev W w'
vim.cmd 'cabbrev Wq wq'
vim.cmd 'cabbrev Wqa wqa'
vim.cmd 'cabbrev WQ wq'
vim.cmd 'cabbrev WQa wqa'
vim.cmd 'cabbrev WQA wqa'

--Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--Other
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<leader>n', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'iferr!=nil', silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up', silent = true })
vim.keymap.set('n', 'B', '<C-v>', { desc = 'Visual Block' })
vim.keymap.set('n', '<leader>q', ':q!<CR>', { desc = 'Close', silent = true })

--[[
  NOTE:Available leader keymaps
  <leader>H
  <leader>K
  <leader>b
  <leader>b
  <leader>l
  <leader>L
  <leader>i
  <leader>I
  <leader>o
  <leader>O
  <leader>P
  <leader>x
  <leader>X
  <leader>y
  <leader>Y
  <leader>v
  <leader>V
  <leader>n
  <leader>N
  <leader>[
  <leader>]
  <leader>{
  <leader>}
]]
