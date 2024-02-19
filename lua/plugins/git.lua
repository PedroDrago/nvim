return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        -- add = { text = "+" },
        -- change = { text = "~" },
        -- delete = { text = "_" },
        -- topdelete = { text = "‾" },
        -- changedelete = { text = "~" },
      },
    },
  },
  {
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",          -- optional
      },
      config = true,
    },
  },
}
