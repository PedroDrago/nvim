return { -- NOTE: Wait for it to be more mature
  'WolfeCub/harpeek.nvim',
  keys = {
    { '<leader>o', ":lua require('harpeek').toggle()<CR>", desc = 'Toggle Harpoon peek', silent = true },
  },
  config = function()
    require('harpeek').setup()
  end,
}
