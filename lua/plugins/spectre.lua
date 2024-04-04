return {
  'nvim-pack/nvim-spectre',
  keys = {
    { '<leader>S', '<cmd>lua require("spectre").toggle()<cr><cmd>lua require("spectre").change_view()<CR>', desc = 'Spectre', silent = true },
    -- { '<leader>SW', '<cmd>lua require("spectre").open_visual({select_word=true})<CR><cmd>lua require("spectre").change_view()<CR>', desc = 'Spectre Word', silent = true },
  },
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
    -- vim.keymap.set('v', '<leader>SW', '<esc><cmd>lua require("spectre").open_visual()<CR><cmd>lua require("spectre").change_view()<CR>', {
    --   desc = 'Spectre Word',
    -- }),
  },
}
