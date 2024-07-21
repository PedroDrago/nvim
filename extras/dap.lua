return {
  'mfussenegger/nvim-dap',
  cond = true,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },
  keys = {
    { '<M-b>', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = 'Debug: Toggle Breakpoint' },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }
    dap.configurations.c = dap.configurations.cpp

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'delve',
      },
    }
    local is_open = false
    vim.keymap.set('n', '<M-n>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<M-s>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<M-r>', function()
      if is_open then
        require('dap').terminate()
        is_open = false
      else
        require('dap').continue()

        is_open = true
      end
    end, { desc = 'Toggle Dap', silent = true })
    vim.keymap.set('n', '<Nop>', dap.step_out, { desc = 'Debug: Step Out' })
    dapui.setup {
      -- icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      -- controls = {
      --   icons = {
      --     pause = '⏸',
      --     play = '▶',
      --     step_into = '⏎',
      --     step_over = '⏭',
      --     step_out = '⏮',
      --     step_back = 'b',
      --     run_last = '▶▶',
      --     terminate = '⏹',
      --     disconnect = '⏏',
      --   },
      -- },
    }

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
      vim.cmd 'wincmd h'
      vim.cmd 'wincmd j'
      vim.cmd 'q'
      vim.cmd 'wincmd j'
      vim.cmd 'q'
      vim.cmd 'wincmd j'
      vim.cmd 'q'
    end
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup()
    require('nvim-dap-virtual-text').setup()
  end,
}
