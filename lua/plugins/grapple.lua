return {
  'cbochs/grapple.nvim',
  cond = true,
  opts = {
    scope = 'git', -- also try out "git_branch"
    status = false,
    win_opts = {
      border = 'rounded',
    },
  },
  cmd = 'Grapple',
  keys = {
    { '<leader>m', '<cmd>Grapple tag<cr>', desc = 'Grapple Mark' },
    { '<leader><Tab>', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple Window' },
    { '<leader>w', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple Next' },
  },
}
