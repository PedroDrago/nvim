return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git', -- also try out "git_branch"
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    {
      '<leader>m',
      function()
        vim.cmd [[ Grapple toggle ]]
        vim.cmd [[ echo "Grappled" ]]
      end,
      desc = 'Grapple Tag',
    },
    { '<leader><Tab>', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple Menu' },
    { '<leader>w', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple Cycle' },
    -- { '<leader>p', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
  },
}
