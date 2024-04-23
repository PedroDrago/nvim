return {
  'nvim-treesitter/nvim-treesitter',
  cond = true,
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      ensure_installed = { 'bash', 'c', 'cpp', 'html', 'lua', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'go', 'javascript', 'typescript', 'rust', 'ruby' },
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { --[[ 'ruby' ]]
        },
      },
      autotag = { enable = true },
    }
  end,
}
