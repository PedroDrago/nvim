-- Disables
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Reset Space' })
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Macro' })
vim.keymap.set('n', 'q', '<nop>', { desc = 'Disable Macro' })
vim.keymap.set('n', '<C-o>', '<nop>', { desc = 'Disable jump list' })
vim.keymap.set('n', '<C-i>', '<nop>', { desc = 'Disable jump list' })

-- Splits
vim.keymap.set('n', '<leader>a', ':vnew <CR>:set rnu<CR>', { desc = 'Split', silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move left ' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move right ' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move up' })
vim.keymap.set('n', '<C-w>', ':wincmd w<CR>', { desc = 'Move focus to next window', silent = true })
vim.keymap.set('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Splits' })
vim.keymap.set('n', '<leader>v', '<C-w>t<C-w>H', { desc = 'Verticalize Splits' })
vim.keymap.set('n', '<leader>h', '<C-w>t<C-w>K', { desc = 'Horizontalize Splits' })
vim.keymap.set('n', '<leader>=', ':wincmd =<CR>', { desc = 'Equalize Buffers', silent = true })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>t', ':terminal<CR>:set nonumber<CR>:set norelativenumber<CR>:set scl=no<CR>a', { desc = 'Open Vertical Terminal', silent = true })
vim.keymap.set('n', '<leader>T', ':split | res 11 | terminal<CR>:set nonumber<CR>:set norelativenumber<CR>:set scl=no<CR>a', { desc = 'Open Horizontal Terminal', silent = true })

-- Misc
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Quit Search' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Selection down', silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Selection up', silent = true })
vim.keymap.set('n', 'B', '<C-v>', { desc = 'Visual Block' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close', silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Void Delete' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Move to end of Line' })
vim.keymap.set({ 'n', 'v' }, 'H', '0', { desc = 'Move to end of Line' })
vim.keymap.set('v', '<Tab>', '>', { desc = 'Indent Right' })
vim.keymap.set('v', '<S-Tab>', '<', { desc = 'Indent Left' })

-- Aliases
vim.cmd 'cabbrev Q q'
vim.cmd 'cabbrev Qa qa'
vim.cmd 'cabbrev W w'
vim.cmd 'cabbrev Wq wq'
vim.cmd 'cabbrev Wqa wqa'
vim.cmd 'cabbrev WQ wq'
vim.cmd 'cabbrev WQa wqa'
vim.cmd 'cabbrev WQA wqa'
