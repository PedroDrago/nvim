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
      dashboard.button('d', '  > Config', ':e $MYVIMRC | cd %:h<CR>'),
      dashboard.button('r', '  > Recent', ":lua require'telescope.builtin'.oldfiles()<CR>"),
      dashboard.button('l', '󰒲  > Lazy', ':Lazy<CR>'),
      dashboard.button('s', '  > Startup', ':Lazy profile<CR>'),
      dashboard.button('h', '✚  > Health', ':checkhealth<CR>'),
      dashboard.button('q', '󰗼  > Quit', ':q!<CR>'),
    }
    dashboard.section.header.opts.hl = 'Function'
    dashboard.section.footer.val = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'Drago' }
    --  󰈞

    vim.cmd [[
        autocmd FileType alpha setlocal nofoldenable
      ]]
  end,
}
