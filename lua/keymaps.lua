--  Move a selected block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

--  Enter visual block mode
vim.keymap.set("n", "B", "<C-v>")

-- Center when navigating vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Go to end or start of line still in normal mode
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- Remove macro recording shit
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<C-o>", "<nop>")

-- Better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

--Dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Closing
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Close Nvim", silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close Buffer", silent = true })

-- Buffer Navigation
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { desc = "Move to left", silent = true })
vim.keymap.set("n", "<leader>w", ":wincmd w<CR>", { desc = "Move to next", silent = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { desc = "Move to right", silent = true })
vim.keymap.set("n", "<leader>a", ":vsplit <CR>:wincmd w<CR>", { desc = "Split", silent = true })
vim.keymap.set("n", "<leader>=", ":wincmd =<CR>", { desc = "Equalize Buffers", silent = true })
vim.keymap.set("n", "<leader>j", "<C-w><C-r>", { desc = "Rotate Splits", silent = true })
-- Maximizer
vim.keymap.set("n", "<leader><CR>", ":MaximizerToggle<CR>", { desc = "Maximize Buffer", silent = true })

-- Toggle autocompletion on/off
vim.keymap.set(
  "n",
  "<leader>x",
  "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>",
  { desc = "cmp Toggle", silent = true }
)

-- Harpoon
vim.keymap.set(
  "n",
  "<leader><leader>",
  ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { desc = "Harpoon Menu", silent = true }
)
vim.keymap.set(
  "n",
  "<leader><Tab>",
  ":lua require('harpoon.ui').nav_next()<CR>",
  { desc = "Harpoon Next", silent = true }
)
vim.keymap.set(
  "n",
  "<leader><S-Tab>",
  ":lua require('harpoon.ui').nav_prev()<CR>",
  { desc = "Harpoon Next", silent = true }
)
vim.keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Harpoon 1", silent = true })
vim.keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Harpoon 2", silent = true })
vim.keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Harpoon 3", silent = true })
vim.keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Harpoon 4", silent = true })
vim.keymap.set("n", "<leader>m", function()
  vim.api.nvim_command('echo "File Marked"')
  require("harpoon.mark").add_file()
end)

-- Git
vim.keymap.set("n", "<leader>y", "nvim_echo('hello')", { desc = "Harpoon 4", silent = true })
