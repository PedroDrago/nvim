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
  snipept('f', {
    text 'func ',
    insert(1, 'Name'),
    text '(',
    insert(2, 'Args'),
    text ') ',
    insert(3, 'Return'),
    text ' {',
    text { '', '\t' },
    insert(4),
    text { '', '}' },
  }),
})

ls.add_snippets('go', {
  snipept('m', {
    text 'func ',
    text '(',
    insert(1, 'Receiver'),
    text ') ',
    insert(2, 'Name'),
    text '(',
    insert(3),
    text ') ',
    insert(4),
    text { ' {', '\t' },
    insert(5),
    text { '', '}' },
  }),
})

ls.add_snippets('go', {
  snipept('t', {
    text 'type ',
    insert(1, 'Name'),
    text { ' struct {', '\t' },
    insert(2),
    text { '', '}', '' },
    insert(3),
  }),
})
