return {
  'sainnhe/gruvbox-material',
  cond = false,
  priority = 1000,
  config = true,
  opts = function()
    vim.g.gruvbox_material_foreground = 'mix' -- material, original, mix
    vim.g.gruvbox_material_background = 'medium' -- hard, medium, soft
    vim.g.gruvbox_material_ui_contrast = 'high' -- low, high
    vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted' -- grey, colored, highlighted
    -- vim.g.gruvbox_material_float_style = 'dim' -- 'bright', 'dim'
    -- vim.g.gruvbox_material_colors_override = {}
    -- vim.g.gruvbox_material_better_performance = '0' -- '0', '1'
    -- vim.g.gruvbox_material_lightline_disable_bold = '0' -- '0', '1'
    -- vim.g.gruvbox_material_statusline_style = 'default' -- 'default', 'mix', 'original'
    -- vim.g.gruvbox_material_disable_terminal_colors = '0' -- '0', '1'
    -- vim.g.gruvbox_material_current_word = 'grey background' -- ''grey background', 'bold', 'underline', 'italic'
    -- vim.g.gruvbox_material_diagnostic_line_highlight = '0' -- '0', '1'
    -- vim.g.gruvbox_material_diagnostic_text_highlight = '0' -- '0', '1'
    -- vim.g.gruvbox_material_show_eob = '1' -- '0', '1'
    -- vim.g.gruvbox_material_spell_foreground = 'none' -- 'none', 'colored'
    -- vim.g.gruvbox_material_sign_column_background = 'nono -- 'none', 'grey'
    -- vim.g.gruvbox_material_menu_selection_background = 'grey' -- 'grey', 'red', 'orange', 'yellow', 'green',
    -- vim.g.gruvbox_material_visual = 'grey background' -- 'grey background', 'gree background'
    -- vim.g.gruvbox_material_dim_inactive_windows = '0' -- '0', '1'
    -- vim.g.gruvbox_material_transparent_background = '0' -- '0', '1', '2'
    -- vim.g.gruvbox_material_cursor = 'auto' -- 'auto', 'red', 'orange', 'yellow', 'green',
    -- vim.g.gruvbox_material_enable_italic = '0' -- '0', '1'
    -- vim.g.gruvbox_material_enable_bold = '0' -- '0', '1'
    -- vim.g.gruvbox_material_disable_italic_comment = '0' -- '0', '1'
    local colors = {
      -- border = 'none' --  NOTE: No border | bg different than bg
      -- winhighlight =
      -- 'Normal:NormalFloat,FloatBorder:NormalFloat'

      border = 'rounded', --  NOTE: thin border | bg equal to bg.
      winhighlight = 'Normal:Normal,FloatBorder:Normal',
    }
    local cmp = require 'cmp'
    cmp.setup {
      window = {
        documentation = cmp.config.window.bordered {
          border = colors.border,
          winhighlight = colors.winhighlight,
        },
        completion = cmp.config.window.bordered {
          border = colors.border,
          winhighlight = colors.winhighlight,
          scrollbar = false,
        },
      },
    }
  end,
  init = function()
    vim.cmd 'colorscheme gruvbox-material'
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '' })
    vim.api.nvim_set_hl(0, 'FloatTitle', { bg = '' })
  end,
}
