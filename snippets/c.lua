local ls = require 'luasnip'
local extras = require 'luasnip.extras'

local snipept = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local func = ls.function_node
local rep = extras.rep

ls.add_snippets('c', {
  snipept('main', {
    text { 'int main(int argc, char *argv[])', '{' },
    text { '', '\t' },
    insert(1),
    text { '', '\treturn 0;' },
    text { '', '}' },
  }),
})

ls.add_snippets('c', {
  snipept('ifnul', {
    text 'if (!',
    insert(1, 'Expression'),
    text { ')', '\treturn(NULL);', '' },
    insert(2),
  }),
})

ls.add_snippets('c', {
  snipept('malloc', {
    insert(1),
    text ' = ',
    text 'malloc(sizeof(',
    insert(2, 'Type'),
    text ') * ',
    insert(3, 'Quantity'),
    text ');',
    text { '', 'if (!' },
    rep(1),
    text { ')', '\treturn (NULL);', '' },
    insert(4),
  }),
})
