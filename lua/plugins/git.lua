return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
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
-- TODO: Configure diffview layout.
-- [ ] New changes to the left.
-- [ ] More readability: Less width to the filetree
-- [ ] Change diff type, maybe diff 3?
