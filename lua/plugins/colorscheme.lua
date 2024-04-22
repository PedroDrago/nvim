return {
  {
    -- SECTION: onedark
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        -- Main options --
        style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = false, -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = '<F9>', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'cool', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },
        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },
        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups
        -- Plugins Config --
        diagnostics = {
          darker = false, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      }
    end,
  },
  {
    -- SECTION: catppuccin
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }
    end,
  },
  {
    -- SECTION: gruvbox-material
    'sainnhe/gruvbox-material',
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
    end,
  },
  {
    -- SECTION: tokyonight
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false }, -- any attr-list value for :help nvim_set_hl
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = 'dark', -- dark, transparent or normal
        floats = 'normal', -- dark, transparent or normal
      },
      sidebars = { 'help' },
      day_brightness = 0.5,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      -----------------------------------
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.gitSigns.add = '#B3F6C0'
        colors.gitSigns.change = '#8CF8F7'
        colors.gitSigns.delete = '#FFC0B9'
      end,
      ---@param hl Highlights
      ---@param colors ColorScheme
      on_highlights = function(hl, colors)
        hl.MiniDiffSignAdd = {
          fg = colors.gitSigns.add,
          bg = '',
        }
        hl.MiniDiffSignChange = {
          fg = colors.gitSigns.change,
          bg = '',
        }
        hl.MiniDiffSignDelete = {
          fg = colors.gitSigns.delete,
          bg = '',
        }
      end,
    },
  },
}
