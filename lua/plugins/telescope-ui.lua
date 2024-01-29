return {
  "nvim-telescope/telescope-ui-select.nvim",
  lazy = true,
  require("telescope").setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  }),
}
