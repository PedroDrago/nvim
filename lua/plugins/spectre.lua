return {
  'nvim-pack/nvim-spectre',
  opts = {
    is_block_ui_break = true,
    mapping = {
      ['send_to_qf'] = {
        map = '<leader><f11>',
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<cr>",
        desc = 'send all items to quickfix',
      },
      ['replace_cmd'] = {
        map = '<leader><f12>',
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<cr>",
        desc = 'input replace command',
      },
      ['show_option_menu'] = {
        map = '<leader><f9>',
        cmd = "<cmd>lua require('spectre').show_options()<cr>",
        desc = 'show options',
      },
      ['run_current_replace'] = {
        map = '<leader><f8>',
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<cr>",
        desc = 'replace current line',
      },
      ['run_replace'] = {
        map = '<leader><f7>',
        cmd = "<cmd>lua require('spectre.actions').run_replace()<cr>",
        desc = 'replace all',
      },
      ['change_view_mode'] = {},
    },
    event = { 'bufreadpost', 'bufnewfile' },
    vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<cr>', {
      desc = 'toggle spectre',
    }),
  },
}
