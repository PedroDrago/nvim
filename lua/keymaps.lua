local keymap = vim.keymap.set

if vim.fn.has 'win32' == 1 or vim.fn.has 'wsl' == 1 then
  keymap('n', '<C-b>', '<C-v>', { desc = 'Vertical Split' })
end

keymap('n', 'dd', function()
  if vim.api.nvim_get_current_line():match '^%s*$' then
    return '"_dd'
  else
    return 'dd'
  end
end, { noremap = true, expr = true })
keymap('i', '<C-BS>', '<C-w>', { noremap = true })
keymap('c', '<C-BS>', '<C-w>', { noremap = true })
keymap('x', '/', '<Esc>/\\%V', { noremap = true })

-- NOTE: Above keymaps Inspiration from [https://github.com/Abstract-IDE/abstract-autocmds](abstract-autocmds)

-- Disables
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Reset Space' })
keymap('n', '<C-z>', '<nop>', { desc = 'Disable suspending Vim' })
keymap('i', '<C-c>', '<nop>', { desc = 'Disable suspending Vim' })

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
-- keymap('n', '<leader>=', '<C-w><C-=>', { desc = 'Equalize Panels' })

-- Terminal
keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<leader>T', '<cmd>vsplit | setlocal nonumber | setlocal norelativenumber | setlocal scl=no | terminal<CR>', { desc = 'Vertical Terminal' })
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
vim.cmd 'cabbrev copilot Copilot'
vim.cmd 'cabbrev theme Theme'
vim.cmd 'cabbrev tree Tree'
