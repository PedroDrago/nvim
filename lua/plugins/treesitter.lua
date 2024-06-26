return {
  'nvim-treesitter/nvim-treesitter',
  cond = true,
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      ensure_installed = {
        'bash',
        'git_config',
        'git_rebase',
        'http',
        'json',
        'xml',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'c',
        'diff',
        'cpp',
        'html',
        'lua',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'go',
        'javascript',
        'typescript',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = false,
        disable = { --[[ 'ruby' ]]
        },
      },
      autotag = { enable = true },
    }
    -- TODO: Learn how to properly configure nvim-treesitter-text-objects in order to have loops, paragraphs, classes and more usefull text objects.
  end,
}
