return {
  'folke/ts-comments.nvim',
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
}
-- FIX: Only needs this because vanilla commenting in C is shit (Uses multiline /* */ comments instead of //). Figure out how to change by hand and get rid of this plugin
