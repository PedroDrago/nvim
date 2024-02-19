vim.loader.enable()              --Speedup Startup time
require("set")                   -- Vim settings
require("lazy-init")             -- Lazy bootstrap
require("lazy").setup("plugins") -- Load all plugins
-- Post import configurations (i have not figured out how to put these in the plugins without breaking)
require("telescope").load_extension("ui-select")
require("neodev").setup()
require("lsp-config")
require("dap-config")

vim.g.cmptoggle = true
local cmp = require("cmp")
cmp.setup({
  enabled = function()
    return vim.g.cmptoggle
  end,
})
require("oil").setup(
  {
      skip_confirm_for_simple_edits = true,
      view_options = {
      show_hidden = true,
    },
    win_options = {
      signcolumn = "yes",
    },
    float = {
      max_width = 70,
      max_height = 30,
    },
  }
)
require("whichkeyconfig")
require("keymaps") -- My keymaps
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
