vim.loader.enable()
local g = vim.g
local opt = vim.opt
local keymap = vim.keymap.set

-------------------------Globals-------------------------------
g.mapleader = ' '
g.maplocalleader = ' '
g.linting = false
-- NOTE: This idea to trigger colorschemes with this globals if for keep unused themes unloaded, saving memory and loadtime (yeah I know it won't make any real difference). But I don't know, it botters me, need to think in a better way to manage colorschemes.
g.tokyonight = true
g.gruvbox = false
g.catppuccin = false
g.rosepine = false
g.onedark = false
g.oxocarbon = false

-------------------------------Options-------------------------
opt.lazyredraw = false -- Testing if improves performance
opt.background = 'dark'
opt.linebreak = true
opt.number = true --Line Numbers
opt.relativenumber = true -- Relative line Numbers
opt.mouse = 'ivc' -- Enables mouse on all modes
opt.showmode = false -- Hide mode since I have a status line
opt.clipboard = 'unnamedplus' -- Shares clipboard with OS
opt.undofile = true -- Enable undo files
opt.swapfile = false -- Disable swap files
opt.ignorecase = true -- Ignore case in patterns
opt.smartcase = true -- No ignore case if pattern has uppercase
opt.smartindent = true -- Insert indents automatically
opt.signcolumn = 'yes' -- Enable the column where gitsigns resides
opt.timeoutlen = 500 -- ms to timeout command sequence
opt.updatetime = 250 -- ms to highlight current token
opt.splitright = true -- Vertical split opens by default to the right
opt.splitbelow = true -- Horizontal split opens by default below
opt.inccommand = 'nosplit' -- Real time update on buffer when substituting text
opt.scrolloff = 10 -- Numbers of lines that the screen starts to scroll vertically
opt.hlsearch = true -- Enable Highlight for previous search
opt.termguicolors = true -- Enable 24-bit color in TUI
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.breakindent = true -- Indent wraped line segment
opt.smoothscroll = true
opt.cmdheight = 0 -- set to 0 to hide the command bar (only if noice is disabled)

-- Indentation
opt.tabstop = 4 -- A TAB character looks like 4 spaces (8 is neovim default)
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
opt.shiftwidth = 4 -- Number of spaces inserted when indenting
opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character

-------------------------Keymaps-----------------------------------

-- Disables
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Reset Space' })
keymap('n', '<C-z>', '<nop>', { desc = 'Disable suspending Vim' })

-- Panels
keymap('n', '<leader>a', '<cmd>vsplit <CR><cmd>set rnu<CR>', { desc = 'Vertical Split' })
keymap('n', '<leader>A', '<cmd>split <CR><cmd>set rnu<CR>', { desc = 'Horizontal Split' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Close Buffer' })
keymap({ 'n', 'i' }, '<C-h>', '<C-w><C-h>', { desc = 'Move left ' })
keymap({ 'n', 'i' }, '<C-l>', '<C-w><C-l>', { desc = 'Move right ' })
keymap({ 'n', 'i' }, '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
keymap({ 'n', 'i' }, '<C-k>', '<C-w><C-k>', { desc = 'Move up' })
keymap('n', '<leader>j', '<C-w><C-r>', { desc = 'Rotate Panels' })
keymap('n', '<leader>v', '<cmd>wincmd J<CR>', { desc = 'Verticalize Panels' })
keymap('n', '<leader>V', '<cmd>wincmd L<CR>', { desc = 'Horizontalize Panels' })
keymap('n', '<leader>=', '<C-w><C-=>', { desc = 'Equalize Panels' })

-- Terminal
keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<leader>T', '<cmd>vsplit | setlocal nonumber | setlocal norelativenumber | setlocal scl=no | terminal<CR>a', { desc = 'Vertical Terminal' })
keymap('n', '<leader>t', '<cmd>botright split | horizontal resize -10 | terminal<CR>', { desc = 'Horizontal Terminal' })

-- Misc
keymap('n', '<leader>r', [[:%s/<C-r><C-w>//g<Left><Left>]], { desc = 'Rename Word' })
keymap('v', '<leader>s', [[:s///g<Left><Left><Left>]], { desc = 'Rename Word In Selected Region' })
keymap('n', '<F1>', '<cmd>Alpha<CR>', { desc = 'Macro Recording' })
-- keymap('n', 'qq', 'q', { desc = 'Macro Recording' })
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Center when Scroll Page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Center when Scroll Page' })
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Quit Search' })
keymap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Void Delete' })
-- keymap('n', '<C-a>', 'ggVG', { desc = 'Select All' })

keymap('v', '<', '<gv', { noremap = true, silent = true })
keymap('v', '>', '>gv', { noremap = true, silent = true })
keymap('v', '<Tab>', '>gv', { desc = 'Indent Right' })
keymap('v', '<S-Tab>', '<gv', { desc = 'Indent Left' })
keymap('x', 'p', [[<Cmd>silent! normal! "_dP<CR>]], { noremap = true, silent = true }) -- NOTE: QOL keymap for pasting in visual mode

keymap('n', 'j', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true, desc = 'Add jumps to jumplist' })
keymap('n', 'k', [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true, desc = 'Add jumps to jumplist' })
------------------ diagnostics-----------------------------
local diagnostics_enabled = true
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
  diagnostics_enabled = not diagnostics_enabled
  vim.diagnostic.enable(diagnostics_enabled)
end, { desc = 'Toggle LSP Diagnostics On/Off' })
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  float = {
    border = 'none',
  },
  virtual_text = {
    spacing = 4,
    source = vim.g.linting,
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return ' '
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return ' '
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return ' '
      else -- HINT
        return ' '
      end
    end,
  },
  severity_sort = true,
  inlay_hints = { enabled = true },
  codelens = { enabled = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.HINT] = 'HintMsg', -- FIX: Not working
      [vim.diagnostic.severity.INFO] = 'InfoMsg', -- FIX: Not working
    },
  },
}

---------------------autocmds----------------------------
-- NOTE: Inspiration from [https://github.com/Abstract-IDE/abstract-autocmds](abstract-autocmds)

local group = vim.api.nvim_create_augroup('MyAuGroup', { clear = true })

local function create_autocmd(events, opts)
  opts = vim.tbl_extend('force', opts, { group = group })
  vim.api.nvim_create_autocmd(events, opts)
end

create_autocmd('VimResized', {
  desc = 'auto resize splited windows',
  pattern = '*',
  command = 'tabdo wincmd =',
})

create_autocmd('BufWinEnter', {
  desc = 'jump to the last position when reopening a file',
  pattern = '*',
  command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

create_autocmd({ 'BufEnter', 'FileType' }, {
  desc = "don't auto comment new line",
  pattern = '*',
  command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

create_autocmd('FileType', {
  desc = "don't auto comment new line",
  pattern = 'cpp',
  command = 'setlocal shiftwidth=4',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlights yanked region',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

create_autocmd('TermOpen', {
  desc = 'Setup Terminal Options',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scl = 'no'
    vim.cmd.startinsert()
  end,
})

---------------------lazy---------------------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'L3MON4D3/LuaSnip',
    cond = true,
    event = 'InsertEnter',
    build = (function()
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    config = function()
      local ls = require 'luasnip'
      ls.config.set_config {
        history = true,
        pdateevents = 'TextChanged,TextChandeI',
        auto_snippets = true,
      }
      require('luasnip.loaders.from_lua').load { paths = vim.fn.stdpath 'config' .. '/snippets' }
    end,
  },
  {
    'stevearc/conform.nvim',
    cond = true,
    config = function()
      local toggle_format_on_save = true
      vim.api.nvim_create_user_command('ToggleFormat', function()
        toggle_format_on_save = not toggle_format_on_save
      end, { desc = 'Toggle Format on Save' })
      require('conform').setup {
        notify_on_error = false,
        formatters_by_ft = {
          lua = { 'stylua' },
          c = nil,
          sql = nil,
          cpp = { 'clang-format' },
          -- lua = nil,
          go = { 'gofumpt' },
          markdown = nil, -- explicitly disable conform for filetype
          md = nil,
        },
      }
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function(args)
          if vim.bo.filetype == '' or not toggle_format_on_save then -- Disable format on save per filetype
            return
          end
          local disable_filetypes = { c = true, cpp = true } -- Disable lsp fallback per filetype
          require('conform').format { bufnr = args.buf, lsp_fallback = not disable_filetypes[vim.bo[args.buf].filetype] }
        end,
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    cond = true,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp_enabled = true
      vim.api.nvim_create_user_command('CmpToggle', function()
        cmp_enabled = not cmp_enabled
        require('cmp').setup { enabled = cmp_enabled }
      end, { desc = 'Toggle Autocompletion On/Off' })
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'
      cmp.setup {
        window = {
          completion = cmp.config.window.bordered {
            scrollbar = false,
          },
        },
        experimental = {
          ghost_text = false,
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            symbol_map = { Copilot = '', Supermaven = '' },
            menu = {
              nvim_lsp = '',
              luasnip = '',
              nvim_lsp_signature_help = '',
              path = '',
              buffer = '',
            },
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mode = 'symbol_text',
        completion = { completeopt = 'menu,menuone,noinsert' },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert {
          -- TODO: Find ideal mapping for confirming completion (confortable on any setup/keyboard and works on every terminal existent)
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Enter>'] = cmp.mapping.confirm { select = true },
          ['<C-CR>'] = cmp.mapping.confirm { select = true },
          ['<C-Return>'] = cmp.mapping.confirm { select = true },

          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          -- { name = 'supermaven' },
          -- { name = 'copilot' },
          { name = 'nvim_lsp', max_item_count = 30 },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
      vim.api.nvim_set_hl(0, 'CmpItemKindSupermaven', { fg = '#6CC644' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cond = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = { progress = { display = { done_ttl = 7 } } } },
    },
    config = function()
      vim.keymap.set('n', '<leader>i', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = 'Toggle Inlay Hints', silent = true })
      vim.lsp.set_log_level 'off' -- INFO: Change this to "debug" when needed
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(modes, keys, func, desc)
            vim.keymap.set(modes, keys, func, { buffer = event.buf, desc = desc })
          end
          map('n', 'gd', function()
            require('telescope.builtin').lsp_definitions { reuse_win = false }
          end, 'Go to Definition')
          map('n', 'ga', function()
            require('telescope.builtin').lsp_definitions { reuse_win = false, jump_type = 'vsplit' }
          end, 'Go to Definition in Split')
          map('n', 'gr', require('telescope.builtin').lsp_references, 'References')
          map('n', 'gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('n', 'gS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('n', '<leader>s', vim.lsp.buf.rename, 'Rename')
          map({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, 'Code Action')
          map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
          map('n', 'H', vim.diagnostic.open_float, 'Expand Diagnostic')
          map('n', 'S', vim.lsp.buf.signature_help, 'Signature Documentation')
          map('i', '<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')
          map('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        clangd = {},
        gopls = {
          settings = { -- NOTE: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            gopls = {
              usePlaceholders = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                unusedparams = false,
              },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
              runtime = { version = 'LuaJIT' },
              codelens = { enabled = true },
              workspace = {
                checkThirdParty = false,
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
              },
            },
          },
        },
      }
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
        -- 'clangd',
      })
      require('mason').setup {
        ui = {
          border = 'single',
        },
      }
      local lsp = require 'lspconfig'
      lsp.util.default_config = vim.tbl_extend('force', lsp.util.default_config, { -- NOTE: THIS DISABLES SEMANTIC TOKENS, THIS IS SUPOSED TO SPEED UP LSP, BUT MAY BE IS NOT WORTH
        on_attach = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            require('lspconfig')[server_name].setup {
              cmd = server.cmd,
              settings = server.settings,
              filetypes = server.filetypes,
              capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            }
          end,
        },
      }
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        enabled = false,
        indent = {
          char = '│',
          tab_char = '│',
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            'help',
            'alpha',
            'dashboard',
            'lazy',
            'mason',
            'terminal',
            'spectre',
          },
        },
      }
      vim.api.nvim_create_user_command('IndentlineToggle', function()
        require('ibl').setup_buffer(0, {
          enabled = not require('ibl.config').get_config(0).enabled,
        })
      end, { desc = 'Toggle Indent Line' })
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    cond = true,
    keys = {
      { '<leader>S', '<cmd>lua require("spectre").toggle()<cr><cmd>lua require("spectre").change_view()<CR>', desc = 'Spectre' },
    },
    opts = {
      is_block_ui_break = true,
      mapping = {
        ['send_to_qf'] = {
          map = '<Nop>',
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<cr>",
          desc = 'send all items to quickfix',
        },
        ['run_replace'] = {
          map = '<leader><CR>',
          cmd = "<cmd>lua require('spectre.actions').run_replace()<cr>",
          desc = 'replace all',
        },
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    cond = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = false,
      keywords = {
        ABOUT = { color = 'test' },
        SECTION = { color = 'test' },
        DOC = { color = 'info' },
      },
    },
  },
  {
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
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    -- TODO: Configure this (make two modes, one where everything is showed and other where only necessary things shows [i.e. thins I don't forget don't show])
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'mbbill/undotree',
    cond = true,
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
    },
    init = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_DiffpanelHeight = 15
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_DiffCommand = 'diff --color'
    end,
  },
  {
    'folke/ts-comments.nvim',

    -- FIX: Only needs this because vanilla commenting in C is shit (Uses multiline /* */ comments instead of //). Figure out how to change by hand and get rid of this plugin
    cond = true,
    opts = {
      lang = {
        c = '// %s',
        --   c_sharp = '// %s',
        --   cpp = '// %s',
        --   html = '<!-- %s -->',
        --   javascript = {
        --     '// %s', -- default commentstring when no treesitter node matches
        --     '/* %s */',
        --     call_expression = '// %s', -- specific commentstring for call_expression
        --     jsx_attribute = '// %s',
        --     jsx_element = '{/* %s */}',
        --     jsx_fragment = '{/* %s */}',
        --     spread_element = '// %s',
        --     statement_block = '// %s',
        --   },
      },
    },
    event = 'VeryLazy',
  },
  {
    'folke/trouble.nvim',
    keys = {
      {
        '<leader>x',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
    },
    opts = {
      auto_fold = false,
      -- signs = {
      --   error = '',
      --   warning = '',
      --   hint = '',
      --   information = '',
      --   other = '',
      -- },
    }, -- for default options, refer to the configuration section for custom setup.
  },
  {
    'folke/noice.nvim',
    cond = true,
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('noice').setup {
        messages = {
          enabled = true,
          view = 'notify', -- default view for messages
          view_error = 'notify', -- view for errors
          view_warn = 'notify', -- view for warnings
          view_history = 'messages', -- view for :messages
          view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
        },
        routes = {
          { filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          }, opts = { skip = true } },
          { filter = {
            event = 'msg_show',
            kind = '',
            find = '; before',
          }, opts = { skip = true } },
          { filter = {
            event = 'msg_show',
            kind = '',
            find = '; after',
          }, opts = { skip = true } },
        },
        cmdline = {
          enabled = true,
          view = 'cmdline_popup',
          opts = {},
          format = {
            cmdline = { pattern = '^:', icon = '', lang = 'vim' },
            search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
            search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
            filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
            lua = {
              pattern = {
                '^:%s*lua%s+',
                '^:%s*lua%s*=%s*',
                [[ '^:%s*=%s*' ]],
              },
              icon = '',
              lang = 'lua',
            },
            help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
            input = {},
          },
        },
        presets = {
          bottom_search = false,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
        lsp = {
          progress = { enabled = false },
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
          hover = {
            enabled = true,
            silent = false,
            view = nil,
            opts = {},
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = false,
              trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50, -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
          },
        },
      }
      -- vim.keymap.set('n', '<leader>n', '<cmd>Noice<CR>', { desc = 'Notifications', silent = true })
    end,
  },
  {
    'echasnovski/mini.nvim',
    cond = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.hipatterns').setup { highlighters = { require('mini.hipatterns').gen_highlighter.hex_color() } }
      require('mini.git').setup { n_lines = 500 }
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.move').setup {
        mappings = {
          left = '<Nop>',
          right = '<Nop>',
          down = 'J',
          up = 'K',
          line_left = '<Nop>',
          line_right = '<Nop>',
          line_down = '<Nop>',
          line_up = '<Nop>',
        },
      }
      require('mini.diff').setup {
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '_' },
        },
        delay = {
          text_change = 100, -- 200 was the default
        },
      }
      vim.keymap.set('n', '<leader>df', function()
        MiniDiff.toggle_overlay(0)
      end, { desc = 'Diff View' })
    end,
  },
  {
    'echasnovski/mini.icons',
    opts = {},
    lazy = true,
    specs = {
      { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    cond = true,
    opts = {},
    config = function()
      local function copilot()
        local client = vim.lsp.get_active_clients({ name = 'copilot' })[1]
        if client == nil then
          return ' '
        end
        return ' '
      end
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
          disabled_filetypes = { 'alpha' },
          ignore_focus = { 'oil', 'grapple', 'TelescopePrompt', 'minifiles' },
          refresh = {
            statusline = 100,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            'filename',
            {
              require('noice').api.status.mode.get,
              cond = require('noice').api.status.mode.has,
              color = { fg = '#ff9e64' },
            },
          },
          lualine_x = { 'filetype' },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      }
    end,
  },
  {
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- Library items can be absolute paths
          -- "~/projects/my-awesome-lib",
          -- Or relative, which means they will be resolved as a plugin
          -- "LazyVim",
          -- When relative, you can also provide a path to the library in the plugin dir
          'luvit-meta/library', -- see below
        },
      },
    },
    { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
      'hrsh7th/nvim-cmp',
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = 'lazydev',
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
  },
  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git', -- also try out "git_branch"
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      {
        '<leader>m',
        function()
          vim.cmd [[ Grapple toggle ]]
          vim.cmd [[ echo "Grappled" ]]
        end,
        desc = 'Grapple toggle tag',
      },
      { '<leader><Tab>', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
      { '<leader>w', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
      -- { '<leader>p', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    cond = true,
    event = { 'BufReadPre', 'BufNewFile' },
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      -- { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          preview = {
            treesitter = true, -- WARN: This lags a lot in large files
          },
          file_ignore_patterns = { '.git/', '.cache', '%.o', '%.a', '%.out', '%.pdf', '%.mkv', '%.mp4', '%.zip', 'node%_modules/.*' },
          selection_caret = ' ',
          entry_prefix = ' ',
          prompt_prefix = '',
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          colorscheme = { enable_preview = true },
          live_grep = { -- TODO: Sizing is shit, fix it (more width)
            additional_args = { '--fixed-strings' },
            theme = 'dropdown',
          },
          find_files = {
            find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
          },
          buffers = {
            mappings = {
              i = {
                ['<c-d>'] = actions.delete_buffer,
              },
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>g', builtin.grep_string, { desc = 'Search Word' })
      vim.keymap.set('n', '<leader>?', builtin.builtin, { desc = 'Search Pickers' })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>b', function()
        builtin.buffers(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end, { desc = 'Search Buffers' })
    end,
  },
  {
    'goolord/alpha-nvim',
    cond = true,
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
        dashboard.button('d', '  > Config', '<cmd>e $MYVIMRC | cd %:h<CR>'),
        -- dashboard.button('r', '  > Recent', "<cmd>lua require'telescope.builtin'.oldfiles()<CR>"),
        dashboard.button('l', '󰒲  > Lazy', '<cmd>Lazy<CR>'),
        dashboard.button('t', '󰏫  > Theme', '<cmd>e' .. vim.fn.stdpath 'config' .. '/lua/colorscheme.lua<CR>'),
        dashboard.button('q', '󰗼  > Quit', '<cmd>q!<CR>'),
      }
      dashboard.section.header.opts.hl = 'Function'
      dashboard.section.footer.val = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'Drago' }

      vim.cmd [[
       autocmd FileType alpha setlocal nofoldenable
     ]]
    end,
  },
  {
    'stevearc/oil.nvim',
    cond = true,
    config = function()
      require('oil').setup {
        win_options = {
          wrap = false,
          cursorcolumn = false,
          foldcolumn = '0',
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = 'nvic',
        },
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-s>'] = 'actions.select_vsplit',
          ['<C-h>'] = '<C-w><C-h>',
          ['<C-l>'] = '<C-w><C-l>',
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
        float = {
          padding = 2,
          max_width = 80,
          max_height = 35,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
        },
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        },
      }
    end,
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    vim.keymap.set('n', '<leader>e', function()
      require('oil').toggle_float()
    end, { desc = 'Oil Float' }),
    vim.keymap.set('n', '<leader>E', '<CMD>Oil<CR>', { desc = 'Oil Buffer' }),
  },
  {
    'folke/tokyonight.nvim',
    cond = vim.g.tokyonight,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end,
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- any attr-list value for :help nvim_set_hl
          keywords = { italic = false },
          functions = {},
          variables = {},
          sidebars = 'dark', -- dark, transparent or normal
          floats = 'dark', -- dark, transparent or normal
        },
        sidebars = { 'help', 'qf', 'terminal' },
        day_brightness = 0.5,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        on_colors = function(colors)
          colors.git.add = '#B3F6C0'
          colors.git.change = '#8CF8F7'
          colors.git.delete = '#FFC0B9'
        end,
        on_highlights = function(hl, colors)
          hl.LineNr = {
            fg = colors.orange,
          }
          hl.MiniDiffSignAdd = {
            fg = colors.git.add,
            bg = '',
          }
          hl.MiniDiffSignChange = {
            fg = colors.git.change,
            bg = '',
          }
          hl.MiniDiffSignDelete = {
            fg = colors.git.delete,
            bg = '',
          }
        end,
      }
      local colors = {
        border = 'none', -- NOTE:  Unbordered Dark bg
        -- winhighlight = 'Normal:Pmenu,FloatBorder:Normal',

        -- border = 'rounded', --  NOTE: Bordered Dark bg
        winhighlight = 'Normal:Pmenu',
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
  },
  {
    'rose-pine/neovim',
    cond = vim.g.rosepine,
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = false,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      }
      local colors = {
        border = 'rounded',
      }
      local cmp = require 'cmp'
      cmp.setup {
        window = {
          documentation = cmp.config.window.bordered { border = colors.border },
          scrollbar = false,
        },
      }
    end,

    init = function()
      vim.cmd.colorscheme 'rose-pine'
      vim.cmd [[hi FloatBorder guibg = Normal]]
      vim.cmd [[hi NormalFloat guibg = Normal]]
      vim.cmd [[hi FloatTitle guibg = Normal]]
    end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    cond = vim.g.oxocarbon,
    priority = 1000,
    opts = {},
    config = function() end,
    init = function()
      vim.cmd.colorscheme 'oxocarbon'
    end,
  },
  {
    'navarasu/onedark.nvim',
    cond = vim.g.onedark,
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
      local colors = {
        border = 'rounded',
      }
      local cmp = require 'cmp'
      cmp.setup {
        window = {
          documentation = cmp.config.window.bordered { border = colors.border },
          scrollbar = false,
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'onedark'
      vim.cmd [[hi FloatBorder guibg = Normal]]
      vim.cmd [[hi NormalFloat guibg = Normal]]
      vim.cmd [[hi FloatTitle guibg = Normal]]
    end,
  },
  {
    'sainnhe/gruvbox-material',
    cond = vim.g.gruvbox,
    priority = 1000,
    config = true,
    opts = function()
      vim.g.gruvbox_material_foreground = 'original' -- material, original, mix
      vim.g.gruvbox_material_background = 'medium' -- hard, medium, soft
      vim.g.gruvbox_material_ui_contrast = 'high' -- low, high
      vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted' -- grey, colored, highlighted
      vim.g.gruvbox_material_show_eob = '0' -- '0', '1'
      -- vim.g.gruvbox_material_float_style = 'dim' -- 'bright', 'dim'
      -- vim.g.gruvbox_material_colors_override = {}
      -- vim.g.gruvbox_material_better_performance = '0' -- '0', '1'
      -- vim.g.gruvbox_material_lightline_disable_bold = '0' -- '0', '1'
      -- vim.g.gruvbox_material_statusline_style = 'default' -- 'default', 'mix', 'original'
      -- vim.g.gruvbox_material_disable_terminal_colors = '0' -- '0', '1'
      -- vim.g.gruvbox_material_current_word = 'grey background' -- ''grey background', 'bold', 'underline', 'italic'
      -- vim.g.gruvbox_material_diagnostic_line_highlight = '0' -- '0', '1'
      -- vim.g.gruvbox_material_diagnostic_text_highlight = '0' -- '0', '1'
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
    init = function()
      local colors = {
        -- border = 'none', --  NOTE: No border | bg different than bg
        -- winhighlight = 'Normal:Pmenu',

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
      vim.cmd.colorscheme 'gruvbox-material'
      -- TODO: The foreground is reseting. Learn to change only bg for hilight group instad of whole group
      -- TODO: Find some way to change the color of the line number only for the current line (hilight LineNr, CursorLineNr, etc.)
      vim.cmd [[hi FloatBorder guibg = Normal]]
      -- vim.cmd [[hi NormalFloat guibg = Normal]] -- NOTE: lsp.hover | bg equal to bg
      vim.cmd [[hi FloatTitle guibg = Normal]]
      -- vim.api.nvim_set_hl(0, 'NormalFloat', {})
      -- vim.api.nvim_set_hl(0, 'FloatBorder', {})
      -- vim.api.nvim_set_hl(0, 'FloatTitle', {})
    end,
  },
  {
    'catppuccin/nvim',
    cond = vim.g.catppuccin,
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
      local colors = {
        border = 'rounded', --  NOTE: thin border | bg equal to bg.
      }
      local cmp = require 'cmp'
      cmp.setup {
        window = {
          documentation = cmp.config.window.bordered { border = colors.border },
          scrollbar = false,
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd [[hi FloatBorder guibg = Normal]]
      vim.cmd [[hi NormalFloat guibg = Normal]]
      vim.cmd [[hi FloatTitle guibg = Normal]]
    end,
  },
}, {

  change_detection = { notify = false },
})

-- vim: ts=2 sts=2 sw=2
