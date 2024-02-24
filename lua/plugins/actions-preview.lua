return {
  "aznhe21/actions-preview.nvim",
  config = function()
    vim.keymap.set({ "v", "n" }, "<leader>c", require("actions-preview").code_actions, { silent = true, desc = "Code Actions"})
  end,
}
