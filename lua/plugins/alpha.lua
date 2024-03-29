return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  enabled = true,
  init = false,
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
      dashboard.button('q', '󰗼  > Quit', ':q!<CR>'),
    }
    dashboard.section.header.opts.hl = 'Function'
    dashboard.section.footer.val = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'Drago' }

    vim.cmd [[
        autocmd FileType alpha setlocal nofoldenable
      ]]
  end,
}
--[[
 Array = 
 Boolean = 
 Class = 
 Color = 
 Constant = 
 Constructor = 
 Enum = 
 EnumMember = 
 Event = 
 Field = 
 File = 
 Folder = 󰉋
 Function = 
 Interface = 
 Key = 
 Keyword = 
 Method = 
 Module = 
 Namespace = 
 Null = 󰟢
 Number = 
 Object = 
 Operator = 
 Package = 
 Property = 
 Reference = 
 Snippet = 
 String = 
 Struct = 
 Text = 
 TypeParameter = 
 Unit = 
 Value = 
 Variable = 
 LineAdded = 
 LineModified = 
 LineRemoved = 
 FileDeleted = 
 FileIgnored = ◌
 FileRenamed = 
 FileStaged = S
 FileUnmerged = 
 FileUnstaged = 
 FileUntracked = U
 Diff = 
 Repo = 
 Octoface = 
 Branch = 
 ArrowCircleDown = 
 ArrowCircleLeft = 
 ArrowCircleRight = 
 ArrowCircleUp = 
 BoldArrowDown = 
 BoldArrowLeft = 
 BoldArrowRight = 
 BoldArrowUp = 
 BoldClose = 
 BoldDividerLeft = 
 BoldDividerRight = 
 BoldLineLeft = ▎
 BookMark = 
 BoxChecked = 
 Bug = 
 Stacks = 
 Scopes = 
 Watches = 󰂥
 DebugConsole = 
 Calendar = 
 Check = 
 ChevronRight = >
 ChevronShortDown = 
 ChevronShortLeft = 
 ChevronShortRight = 
 ChevronShortUp = 
 Circle = 
 Close = 󰅖
 CloudDownload = 
 Code = 
 Comment = 
 Dashboard = 
 DividerLeft = 
 DividerRight = 
 DoubleChevronRight = »
 Ellipsis = 
 EmptyFolder = 
 EmptyFolderOpen = 
 File = 
 FileSymlink = 
 Files = 
 FindFile = 󰈞
 FindText = 󰊄
 Fire = 
 Folder = 󰉋
 FolderOpen = 
 FolderSymlink = 
 Forward = 
 Gear = 
 History = 
 Lightbulb = 
 LineLeft = ▏
 LineMiddle = │
 List = 
 Lock = 
 NewFile = 
 Note = 
 Package = 
 Pencil = 󰏫
 Plus = 
 Project = 
 Search = 
 SignIn = 
 SignOut = 
 Tab = 󰌒
 Table = 
 Target = 󰀘
 Telescope = 
 Text = 
 Tree = 
 Triangle = 󰐊
 TriangleShortArrowDown = 
 TriangleShortArrowLeft = 
 TriangleShortArrowRight = 
 TriangleShortArrowUp = 
 BoldError = 
 Error = 
 BoldWarning = 
 Warning = 
 BoldInformation = 
 Information = 
 BoldQuestion = 
 Question = 
 BoldHint = 
 Hint = 󰌶
 Debug = 
 Trace = ✎
 Robot = 󰚩
 Squirrel = 
 Tag = 
 Watch = 
 Smiley = 
 Package = 
 CircuitBoard = 
-- ]]
