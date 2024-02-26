vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'J', vim.diagnostic.open_float, { desc = 'Expand Diagnostic' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Buffer Navigation
vim.keymap.set('n', '<leader>w', ':wincmd w<CR>', { desc = 'Move focus to next window', silent = true })
vim.keymap.set('n', '<leader>a', ':vsplit <CR>', { desc = 'Split', silent = true })
vim.keymap.set('n', '<leader>=', ':wincmd =<CR>', { desc = 'Equalize Buffers', silent = true })
vim.keymap.set('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Splits', silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--  Move a selected block up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

--  Enter visual block mode
vim.keymap.set('n', 'B', '<C-v>')

-- Center when navigating vertically
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Remove macro recording shit
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 'q', '<nop>')
vim.keymap.set('n', '<C-o>', '<nop>')

vim.keymap.set('n', '<leader>q', ':q<CR>')
-- Better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>t', ':vsplit<CR>:terminal<CR>a', { desc = 'Open Vertical Terminal', silent = true })
