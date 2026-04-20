return {
  'zbirenbaum/copilot.lua',
  enabled = true,
  cmd = 'Copilot',
  event = 'InsertEnter',
  build = ':Copilot auth',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
          toggle_auto_trigger = false,
        },
      },
      filetypes = {
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node',
      server_opts_overrides = {},
    }

    local suggestion = require 'copilot.suggestion'

    local function accept_suggestion()
      if suggestion.is_visible() then
        suggestion.accept()
      end
    end

    vim.keymap.set('i', '<C-Tab>', accept_suggestion, { silent = true, desc = 'Accept Copilot Suggestion' })
    vim.keymap.set('i', '<M-l>', accept_suggestion, { silent = true, desc = 'Accept Copilot Suggestion (Fallback)' })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuOpen',
      callback = function()
        vim.b.copilot_suggestion_hidden = true
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuClose',
      callback = function()
        vim.b.copilot_suggestion_hidden = false
      end,
    })
  end,
}
