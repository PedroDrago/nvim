vim.loader.enable()              --Speedup Startup time
require("set")                   -- Vim settings
require("keymaps")               -- My keymaps
require("lazy-init")             -- Lazy bootstrap
require("lazy").setup("plugins") -- Load all plugins

-- Post import configurations (i have not figured out where to put these witouth breaking)
require("telescope").load_extension("ui-select")
require('neodev').setup()
require("lsp-config")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
