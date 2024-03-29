return {
  'artemave/workspace-diagnostics.nvim',
  opts = {},
}

--[[ 
NOTE: On lspconfig tsserver configuration
require('lspconfig').tsserver.setup({
  on_attach = function(client, bufnr)
                ...
                require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
                ...
              end
})
--]]
