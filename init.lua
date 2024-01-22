vim.loader.enable()
-- Including other config files
require("set") -- Vim settings
require("keymaps") -- My keymaps

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins
require("lazy").setup("plugins")

-- Post import configurations (i have not figured out where to put these witouth breaking)
require("telescope").load_extension("ui-select")
require('neodev').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
