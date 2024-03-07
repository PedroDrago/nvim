return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  build = (function()
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  config = function()
    local ls = require 'luasnip'
    ls.config.set_config {
      history = true,
      pdateevents = 'TextChanged,TextChandeI',
      auto_snippets = true,
    }
    require('luasnip.loaders.from_lua').load { paths = vim.fn.stdpath 'config' .. '/snippets' }
  end,
}
