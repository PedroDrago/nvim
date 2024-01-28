vim.keymap.set(
  "n",
  "<leader>db",
  ":lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Toggle Breakpoint", silent = true }
)
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Continue", silent = true })
vim.keymap.set("n", "<leader>dn", ":lua require'dap'.step_over()<CR>", { desc = "Next", silent = true })
vim.keymap.set("n", "<leader>ds", ":lua require'dap'.step_into()<CR>", { desc = "Step In", silent = true })
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", { desc = "UI", silent = true })


require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
local dap = require("dap")
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode-14", -- adjust as needed, must be absolute path
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},

    --
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
