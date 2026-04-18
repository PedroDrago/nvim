return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    local fzf = require 'fzf-lua'
    local actions = require('fzf-lua.actions')

    fzf.setup {
      { 'telescope', 'hide' },
      fzf_colors = true,
      winopts = {
        preview = {
          default = 'builtin',
        },
      },
      actions = {
        files = {
          ['ctrl-d'] = actions.buf_del,
        },
      },
      lsp = {
        jump1 = true,
      },
    }

    fzf.register_ui_select()

    vim.keymap.set('n', '<leader>f', fzf.files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>g', fzf.grep_cword, { desc = 'Search Word' })
    vim.keymap.set('n', '<leader>?', fzf.builtin, { desc = 'Search Pickers' })
    vim.keymap.set('n', '<leader>/', fzf.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = 'Search Buffers' })
  end,
}
