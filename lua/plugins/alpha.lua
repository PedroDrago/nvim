return {
  'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
        dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("d", "  > Dotfiles", ":cd ~/.config/nvim | :e init.lua<CR>"),
        dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
        dashboard.button("q", "󰗼  > Quit", ":q!<CR>"),
      }
      dashboard.section.header.opts.hl = "Function"

--  Disable folding on alpha buffer
      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end
}
