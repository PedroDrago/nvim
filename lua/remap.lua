--  Move a selected block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

--  B to enter visual block mode
vim.keymap.set("n", "B", "<C-v>")

-- center when navigating vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete without yanking
-- vim.keymap.set("n", "<leader>d", "\"_d", { desc = 'Delete without yanking', silent = true })
-- vim.keymap.set("v", "<leader>d", "\"_d", { desc = 'Delete without yanking', silent = true })

-- Remove recording shit
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Terminal
vim.keymap.set("n", "<leader>t", ":ToggleTerm dir=pwd direction=float <CR>", { desc = 'Open Floating Terminal', silent = true })
vim.keymap.set("n", "<leader>v", ":ToggleTerm size=100 dir=pwd direction=vertical <CR>", { desc = 'Open vertical Terminal', silent = true })
-- Exit terminal Mode
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('n', "<leader>c", ":lua vim.lsp.buf.code_action()<CR>", { desc = 'Code Action', silent = true })

-- nvimtree
vim.keymap.set('n', "<leader>e", ":NvimTreeToggle <CR>", { desc = 'Toggle Nvim-Tree', silent = true })
-- Spliting remap
vim.keymap.set('n', "<leader>h", ":wincmd h<CR>", { desc = 'Move to left', silent = true})
vim.keymap.set('n', "<leader>w", ":wincmd w<CR>", { desc = 'Move to next', silent = true })
vim.keymap.set('n', "<leader>l", ":wincmd l<CR>", { desc = 'Move to right', silent = true })
vim.keymap.set('n', "<leader>a", ":vsplit <CR>", { desc = 'Split' , silent = true})
vim.keymap.set('n', "<leader>q", ":wincmd c<CR>", { desc = 'Close Buffer', silent = true })
vim.keymap.set('n', "<leader>=", ":wincmd +<CR>")
vim.keymap.set('n', "<leader>-", ":wincmd -<CR>")

--vim surround keymaps
vim.api.nvim_set_keymap('n', '(', [[:execute "normal \<Plug>Ysurroundiw)"<CR>]], { noremap = true, silent = true , desc = 'Surround current word with ()'})
vim.api.nvim_set_keymap('n', '{', [[:execute "normal \<Plug>Ysurroundiw}"<CR>]], { noremap = true, silent = true , desc = 'Surround current word with {}'})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
--
--
-- Debugging
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
