return {
  'nvim-pack/nvim-spectre',
  event = { 'BufReadPost', 'BufNewFile' },
  vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = 'Toggle Spectre',
  }),
}
