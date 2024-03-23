return {
  { 'lewis6991/gitsigns.nvim', opts = {}, event = { 'BufReadPre', 'BufNewFile' } },
  { 'tpope/vim-fugitive', event = { 'BufReadPre', 'BufNewFile' } },
  {
    'sindrets/diffview.nvim',
    opts = {},
    config = function()
      local diffViewEnable = false
      vim.api.nvim_create_user_command('ToggleDiffView', function()
        if diffViewEnable then
          diffViewEnable = false
          vim.api.nvim_command 'echo "Diff Off"'
          vim.api.nvim_command 'silent DiffviewClose'
        else
          diffViewEnable = true
          vim.api.nvim_command 'echo "Diff On"'
          vim.api.nvim_command 'silent DiffviewOpen'
        end
      end, {})
    end,
    keys = { { '<leader>D', ':ToggleDiffView<CR>', desc = 'Diffview', silent = true } },
  },
}
-- TODO: Configure diffview layout. New changes to the left.
