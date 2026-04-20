return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function(_, opts)
    require('snacks').setup(opts)
    require('snacks.input').enable()
  end,
  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
  },
}
