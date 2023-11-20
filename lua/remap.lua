--  Move a selected block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--  B to enter visual block mode
vim.keymap.set("n", "B", "<C-v>")

--  renaming all occurrences of current 
--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--auto transforms script into executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- center when navigating vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete without yanking
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Remove recording shit
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Terminal
-- open Floating Terminal
vim.keymap.set("n", "<leader>t", ":ToggleTerm dir=pwd direction=float <CR>")
-- Open vertical Terminal
vim.keymap.set("n", "<leader>v", ":ToggleTerm size=100 dir=pwd direction=vertical <CR>")
-- Exit terminal Mode
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])


vim.keymap.set('n', "<leader>c", ":lua vim.lsp.buf.code_action()<CR>")

-- nvimtree
vim.keymap.set('n', "<leader>e", ":NvimTreeToggle <CR>")

-- Spliting remap
vim.keymap.set('n', "<leader>h", ":wincmd h<CR>") --move to left
vim.keymap.set('n', "<leader>w", ":wincmd w<CR>") --move to next
vim.keymap.set('n', "<leader>l", ":wincmd l<CR>") -- move to left
vim.keymap.set('n', "<leader>a", ":vsplit <CR>")  -- split vertically
vim.keymap.set('n', "<leader>q", ":wincmd c<CR>") -- close currentwindow
vim.keymap.set('n', "<leader>=", ":wincmd +<CR>") -- close currentwindow
vim.keymap.set('n', "<leader>-", ":wincmd -<CR>") -- close currentwindow
