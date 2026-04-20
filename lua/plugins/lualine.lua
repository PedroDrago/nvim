return {
  'nvim-lualine/lualine.nvim',
  cond = true,
  opts = {},
  config = function()
    local ok_noice, noice = pcall(require, 'noice')

    local function copilot()
      local client = vim.lsp.get_clients({ name = 'copilot', bufnr = 0 })[1]
      if client == nil then
        return ' '
      end
      return ' '
    end
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = { 'alpha' },
        ignore_focus = { 'oil', 'grapple', 'TelescopePrompt', 'FzfLua', 'minifiles' },
        refresh = {
          statusline = 100,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = (function()
          local sections = { 'filename' }
          if ok_noice then
            table.insert(sections, {
              noice.api.status.mode.get,
              cond = noice.api.status.mode.has,
              color = { fg = '#ff9e64' },
            })
          end
          return sections
        end)(),
        lualine_x = { copilot, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
