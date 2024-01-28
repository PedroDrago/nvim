return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = { --[[ things you want to change go here]]
  },
  vim.keymap.set(
    "n",
    "<leader>t",
    ":ToggleTerm dir=pwd direction=float <CR>",
    { desc = "Open Floating Terminal", silent = true }
  ),
  vim.keymap.set(
    "n",
    "<leader>v",
    ":ToggleTerm size=100 dir=pwd direction=vertical <CR>",
    { desc = "Open vertical Terminal", silent = true }
  ),
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]]),
}
