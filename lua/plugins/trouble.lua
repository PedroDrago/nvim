return {
  'folke/trouble.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    mode = 'workspace_diagnostics',
  },
  config = function()
    local troubleEnable = false
    vim.api.nvim_create_user_command('ToggleTroubleWorkspace', function()
      if troubleEnable then
        troubleEnable = false
        vim.api.nvim_command 'TroubleClose'
      else
        troubleEnable = true
        vim.api.nvim_command 'Trouble workspace_diagnostics'
      end
    end, {})
  end,
  vim.keymap.set('n', '<leader>z', ':ToggleTroubleWorkspace<CR>', { silent = true, desc = 'Trouble' }),
}
