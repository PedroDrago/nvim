-- Disables
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Reset Space' })
vim.keymap.set('n', 'q', '<nop>', { desc = 'Disable Default Macro Recording' })
vim.keymap.set('n', '<C-o>', '<nop>', { desc = 'Disable jump list' })
vim.keymap.set('n', '<C-i>', '<nop>', { desc = 'Disable jump list' })
vim.keymap.set('n', '<C-q>', '<nop>', { desc = 'Disable default block mode keymap' })

-- Panels
vim.keymap.set('n', '<leader>a', '<cmd>vsplit <CR><cmd>set rnu<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>A', '<cmd>new <CR><cmd>set rnu<CR>', { desc = 'Horizontal Split' })
-- vim.keymap.set('n', '<leader>q', '<C-w><C-c>', { desc = 'Close Panel' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Close Panel' })
vim.keymap.set('n', '<leader>Q', '<cmd>q<CR>', { desc = 'Close Panel' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move left ' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move right ' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move up' })
vim.keymap.set('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Panels' })
vim.keymap.set('n', '<leader>v', '<C-w>t<C-w>H', { desc = 'Verticalize Panels' })
vim.keymap.set('n', '<leader>h', '<C-w>t<C-w>K', { desc = 'Horizontalize Panels' })
vim.keymap.set('n', '<leader>=', '<C-w><C-=>', { desc = 'Equalize Panels' })
vim.keymap.set('n', '<left>', '<cmd>vertical resize +5<cr>', { desc = 'Increase Vertical Split size' })
vim.keymap.set('n', '<right>', '<cmd>vertical resize -5<cr>', { desc = 'Decrease Vertical Split size' })
vim.keymap.set('n', '<up>', '<cmd>horizontal resize +2<cr>', { desc = 'Increase Horizontal Split size' })
vim.keymap.set('n', '<down>', '<cmd>horizontal resize -2<cr>', { desc = 'Decrease Horizontal Split size' })

-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>t', '<cmd>vsplit | set nonumber | set norelativenumber | set scl=no | terminal<CR>a', { desc = 'Vertical Terminal' })
vim.keymap.set('n', '<leader>T', '<cmd>botright split | horizontal resize -10 | set nonumber | set norelativenumber | set scl=no | terminal<CR>a', { desc = 'Horizontal Terminal' })

-- Misc
vim.keymap.set('n', 'qq', 'q', { desc = 'Macro Recording' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center when Scroll Page' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Quit Search' })
vim.keymap.set('n', 'B', '<C-v>', { desc = 'Visual Block' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Void Delete' })
vim.keymap.set('v', '<Tab>', '>', { desc = 'Indent Right' })
vim.keymap.set('v', '<S-Tab>', '<', { desc = 'Indent Left' })
vim.keymap.set('n', '<leader>h', '<C-t>', { desc = 'Indent Left' })

-- Aliases
vim.cmd 'cabbrev Q q'
vim.cmd 'cabbrev Qa qa'
vim.cmd 'cabbrev W w'
vim.cmd 'cabbrev Wq wq'
vim.cmd 'cabbrev Wqa wqa'
vim.cmd 'cabbrev WQ wq'
vim.cmd 'cabbrev WQa wqa'
vim.cmd 'cabbrev WQA wqa'
