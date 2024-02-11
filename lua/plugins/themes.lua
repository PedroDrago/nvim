return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        -- style = "dark",
        -- style = "cool",
        -- style = "darker",
        -- style = "deep",
        -- style = "warm",
        -- style = "warmer",
      })
    end,
  },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000 },
  { "sainnhe/edge",             lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim",    lazy = false, priority = 1000 },
  {
    "zaldih/themery.nvim",
    -- Minimal config
    config = function()
      require("themery").setup({
        themes = { "gruvbox-material", "onedark", "edge", "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus" }, -- Your list of installed colorschemes
        themeConfigFile = "~/.config/nvim/lua/theme.lua",                                                     -- Described below
        livePreview = true,                                                                                   -- Apply theme while browsing. Default to true.
      })
    end,
  },
}
