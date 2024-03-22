return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup {
      layout = {
        align = 'center',
      },
    }
    require('which-key').register {
      ['<leader>1'] = 'which_key_ignore',
      ['<leader>2'] = 'which_key_ignore',
      ['<leader>3'] = 'which_key_ignore',
      ['<leader>4'] = 'which_key_ignore',
      ['<leader>='] = 'which_key_ignore',
      ['<leader>a'] = 'which_key_ignore',
      ['<leader>d'] = 'which_key_ignore',
      ['<leader>j'] = 'which_key_ignore',
      ['<leader>Q'] = 'which_key_ignore',
      ['<leader>q'] = 'which_key_ignore',
      ['<leader>T'] = 'which_key_ignore',
      ['<leader>t'] = 'which_key_ignore',
      ['<leader>w'] = 'which_key_ignore',
      ['<leader>S'] = 'Spectre',
      ['<leader>'] = '<Space>',
    }
  end,
}
