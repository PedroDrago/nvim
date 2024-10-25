local ls = require 'luasnip'

local snipept = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local func = ls.function_node

ls.add_snippets('go', {
  snipept('ifer', {
    text 'if err != nil {',
    text { '', '\t' },
    insert(1),
    text { '', '}', '' },
    insert(2),
  }),
})

ls.add_snippets('go', {
  snipept('timeout', {
    text 'ctx, cancel := context.WithTimeout(context.Background(), ',
    insert(1, 'Time'),
    text { '*time.' },
    insert(2, 'Unit'),
    text { ')', '' },
    text { 'defer cancel()', '' },
  }),
})

ls.add_snippets('go', {
  snipept('switch', {
    text { 'switch {', '' },
    text { 'case ' },
    insert(1, ''),
    text { ':', '\t' },
    insert(2, ''),
    text { '', 'default: ', '\t' },
    insert(3, ''),

    text { '', '}' },
  }),
})
