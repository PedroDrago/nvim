vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.hlsearch = false                 -- Set highlight on search
vim.wo.number = true                   -- Make line numbers default
vim.o.mouse = "a"                      -- Enable mouse mode
vim.o.clipboard = "unnamedplus"        -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true               -- Enable break indent
vim.o.undofile = true                  -- Save undo history
vim.o.ignorecase = true                -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true                 -- Case-insensitive searching UNLESS \C or capital in search
vim.wo.signcolumn = "yes"              -- Keep signcolumn on by default
vim.o.updatetime = 250                 -- Decrease update time
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.o.termguicolors = true             -- Only turn on if terminal supports it
vim.wo.relativenumber = true           -- Set lines number to Relative
vim.wo.scrolloff = 10                  --  Screen scrolls down/up when 10 lines from screen end
vim.wo.sidescrolloff = 10              -- Screen scrolls right/left when 10 characters from screen end
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.wrap = false     -- Remove line wrap
vim.o.swapfile = false -- Disable swap files creation

-- highlight on_yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
