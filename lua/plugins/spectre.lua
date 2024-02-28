return {
  'nvim-pack/nvim-spectre',
  event = 'VeryLazy',
  opts = {
    is_block_ui_break = true,
    mapping = {
      ['send_to_qf'] = {
        map = '<Nop>',
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<cr>",
        desc = 'send all items to quickfix',
      },
      ['run_replace'] = {
        map = '<leader><CR>',
        cmd = "<cmd>lua require('spectre.actions').run_replace()<cr>",
        desc = 'replace all',
      },
    },
    event = { 'bufreadpost', 'bufnewfile' },
    vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<cr><cmd>lua require("spectre").change_view()<CR>', {
      desc = 'toggle spectre',
    }),
    vim.keymap.set('n', '<leader>W', '<cmd>lua require("spectre").open_visual({select_word=true})<CR><cmd>lua require("spectre").change_view()<CR>', {
      desc = 'Search current word',
    }),
    vim.keymap.set('v', '<leader>W', '<esc><cmd>lua require("spectre").open_visual()<CR><cmd>lua require("spectre").change_view()<CR>', {
      desc = 'Search current word',
    }),
  },
}
