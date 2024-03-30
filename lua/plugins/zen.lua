return {
  {
    'folke/zen-mode.nvim',
    dependencies = {},
    keys = { { '<leader>z', ':ZenMode<CR>', desc = 'Zen Mode', silent = true } },
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        options = {
          signcolumn = 'no', -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          foldcolumn = '0', -- disable fold column
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win)
        vim.diagnostic.disable()
        require('cmp').setup.buffer { enabled = false }
      end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function()
        vim.diagnostic.enable()
        require('cmp').setup.buffer { enabled = true }
      end,
    },
  },
}
