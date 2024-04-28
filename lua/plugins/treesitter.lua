return {
  'nvim-treesitter/nvim-treesitter',
  cond = true,
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
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
    -- TODO: Learn how to properly configure nvim-treesitter-text-objects in order to have loops, paragraphs, classes and more usefull text objects.
  end,
}
