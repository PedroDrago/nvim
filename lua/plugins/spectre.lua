return {
  'nvim-pack/nvim-spectre',
  opts = {
    is_block_ui_break = true,
    mapping = {
      ['send_to_qf'] = {
        map = '<leader><F11>',
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = 'send all items to quickfix',
      },
      ['replace_cmd'] = {
        map = '<leader><F12>',
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = 'input replace command',
      },
      ['show_option_menu'] = {
        map = '<leader><F9>',
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = 'show options',
      },
      ['run_current_replace'] = {
        map = '<leader><F8>',
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = 'replace current line',
      },
      ['run_replace'] = {
        map = '<leader><F7>',
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = 'replace all',
      },
      ['change_view_mode'] = {},
    },
    event = { 'BufReadPost', 'BufNewFile' },
    vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
      desc = 'Toggle Spectre',
    }),
  },
}
