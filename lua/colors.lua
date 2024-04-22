vim.cmd 'colorscheme tokyonight-night'
-- vim.cmd 'colorscheme tokyonight-storm'
-- vim.cmd 'colorscheme gruvbox-material'
-- vim.cmd 'colorscheme catppuccin'
-- vim.cmd 'colorscheme onedark'

local function paint()
  local colors = {}
  if vim.g.colors_name == 'gruvbox-material' then
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '' })
    vim.api.nvim_set_hl(0, 'FloatTitle', { bg = '' })
    -- border = 'none' --  No border | bg different than bg
    -- winhighlight = 'Normal:NormalFloat,FloatBorder:NormalFloat'

    colors.border = 'rounded' --  thin border | bg equal to bg.
    colors.winhighlight = 'Normal:Normal,FloatBorder:Normal'
  elseif vim.g.colors_name == 'tokyonight' then
    -- border = 'none' --  No border | bg different than bg
    -- winhighlight = 'Normal:Pmenu,FloatBorder:Normal'

    colors.border = 'rounded' --  No border | bg different than bg
    colors.winhighlight = 'Normal:Normal'
  elseif vim.g.colors_name == 'onedark' then
  elseif vim.g.colors_name == 'catppuccin' then
  end
  return colors
end

local colors = paint()

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
