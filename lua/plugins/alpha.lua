return {
  'goolord/alpha-nvim',
  config = function()
    require('alpha').setup(require('alpha.themes.dashboard').config)
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.header.val = {
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }
    dashboard.section.buttons.val = {
      dashboard.button('d', '  > Dotfiles', ':cd ' .. vim.fn.stdpath 'config' .. ' | :e init.lua<CR>'),
      dashboard.button('l', '󰒲  > Lazy', ':Lazy<CR>'),
      dashboard.button('h', '✚  > Health', ':checkhealth<CR>'),
      dashboard.button('q', '󰗼  > Quit', ':q!<CR>'),
    }
    dashboard.section.header.opts.hl = 'Function'
    -- dashboard.section.footer.val = 'Pedro Drago'

    vim.cmd [[
        autocmd FileType alpha setlocal nofoldenable
      ]]
  end,
}
