return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")
      -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      -- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
      -- vim.keymap.set('n', '<leader>n', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
      vim.keymap.set("n", "<leader>?", require("telescope.builtin").builtin, { desc = "All Telescope Pickers" })
      vim.keymap.set("n", "<leader>g", function()
        require("telescope.builtin").live_grep({
          layout_config = {
            height = 0.9,
            width = 0.9,
          },
        })
      end, { desc = "Live Grep" })

      vim.keymap.set("n", "<leader>f", function()
        require("telescope.builtin").find_files({
          previewer = false,
          layout_config = {
            height = 0.5,
            width = 0.4,
          },
        })
      end, { desc = "Search Files" })

      vim.keymap.set("n", "<leader>b", function()
        require("telescope.builtin").current_buffer_fuzzy_find({
          winblend = 15,
          previewer = true,
          layout_config = {
            height = 0.8,
            width = 0.8,
          },
        })
      end, { desc = "Search in Buffer" })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },
}
