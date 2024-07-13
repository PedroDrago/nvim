local keymap = vim.keymap.set
-- Disables
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Reset Space' })
keymap('n', 'q', '<nop>', { desc = 'Disable Default Macro Recording' })
keymap('n', '<C-z>', '<nop>', { desc = 'Disable suspending Vim' })

-- Panels
keymap('n', '<leader>a', '<cmd>vsplit <CR><cmd>set rnu<CR>', { desc = 'Vertical Split' })
keymap('n', '<leader>A', '<cmd>split <CR><cmd>set rnu<CR>', { desc = 'Horizontal Split' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Close Buffer' })
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move left ' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move right ' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move up' })
keymap('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Panels' })
keymap('n', '<leader>v', '<cmd>wincmd J<CR>', { desc = 'Verticalize Panels' })
keymap('n', '<leader>V', '<cmd>wincmd L<CR>', { desc = 'Horizontalize Panels' })
keymap('n', '<leader>=', '<C-w><C-=>', { desc = 'Equalize Panels' })
keymap('n', '<left>', '<cmd>vertical resize +5<cr>', { desc = 'Increase Vertical Split size' })
keymap('n', '<right>', '<cmd>vertical resize -5<cr>', { desc = 'Decrease Vertical Split size' })
keymap('n', '<up>', '<cmd>horizontal resize +2<cr>', { desc = 'Increase Horizontal Split size' })
keymap('n', '<down>', '<cmd>horizontal resize -2<cr>', { desc = 'Decrease Horizontal Split size' })

-- Terminal
keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<leader>T', '<cmd>vsplit | setlocal nonumber | setlocal norelativenumber | setlocal scl=no | terminal<CR>a', { desc = 'Vertical Terminal' })
keymap('n', '<leader>t', '<cmd>botright split | horizontal resize -10 | terminal<CR>', { desc = 'Horizontal Terminal' })

-- Misc
keymap('n', '<leader>r', [[:%s/<C-r><C-w>//g<Left><Left>]], { desc = 'Rename Word' })
keymap('v', '<leader>s', [[:s///g<Left><Left><Left>]], { desc = 'Rename Word In Selected Region' })
keymap('n', '<F1>', '<cmd>Alpha<CR>', { desc = 'Macro Recording' })
keymap('n', 'qq', 'q', { desc = 'Macro Recording' })
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Center when Scroll Page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Center when Scroll Page' })
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Quit Search' })
keymap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Void Delete' })
keymap('v', '<Tab>', '>', { desc = 'Indent Right' })
keymap('v', '<S-Tab>', '<', { desc = 'Indent Left' })
keymap('n', '<C-a>', 'ggVG', { desc = 'Select All' })

-- Aliases
vim.cmd 'cabbrev Q q'
vim.cmd 'cabbrev Qa qa'
vim.cmd 'cabbrev W w'
vim.cmd 'cabbrev Wq wq'
vim.cmd 'cabbrev Wqa wqa'
vim.cmd 'cabbrev WQ wq'
vim.cmd 'cabbrev WQa wqa'
vim.cmd 'cabbrev WQA wqa'

vim.cmd 'cabbrev git Git'
vim.cmd 'cabbrev gs Git status'
vim.cmd 'cabbrev gss Git status --short'
vim.cmd 'cabbrev ga Git add'
vim.cmd 'cabbrev gaa Git add .'
vim.cmd 'cabbrev gc Git commit'
vim.cmd 'cabbrev gcm Git commit -m '
vim.cmd 'cabbrev gl Git log'
vim.cmd 'cabbrev gp Git push'
vim.cmd 'cabbrev gpl Git pull'
