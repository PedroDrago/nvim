return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {"onsails/lspkind.nvim"},
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    -- Useful status updates for LSP
    { "j-hui/fidget.nvim",       tag = "legacy", opts = {}, lazy = true },
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
  },
}
