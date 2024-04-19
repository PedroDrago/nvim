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
  snipept('f', {
    insert(1),
    text '(',
    insert(2),
    text ')',
    text { '', '{', '\t' },
    insert(3),
    text { '', '\treturn (' },
    insert(4),
    text ');',
    text { '', '}' },
  }),
})

ls.add_snippets('cpp', {
  snipept('t', {
    text 'typedef struct ',
    insert(1, 'Name'),
    text { '', '{', '\t' },
    insert(2),
    text { '', '} \t' },
    rep(1),
    text ';',
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
  snipept('v', {
    text '(void) ',
    insert(1, 'Variable'),
  }),
})

ls.add_snippets('c', {
  snipept('ws', {
    text 'while(',
    insert(1, 'Array'),
    text '[',
    insert(2, 'Index'),
    text { '])', '{' },
    text { '', '\t' },
    insert(3),
    text { '', '}' },
  }),
})

ls.add_snippets('c', {
  snipept('w', {
    text 'while(',
    insert(1, 'Condition'),
    text { ')', '{' },
    text { '', '\t' },
    insert(2),
    text { '', '}' },
  }),
})

ls.add_snippets('c', {
  snipept('m', {
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

ls.add_snippets('c', {
  snipept('c', {
    insert(1),
    text ' = ',
    text 'ft_calloc(sizeof(',
    insert(2, 'Type'),
    text '), ',
    insert(3, 'Quantity'),
    text ');',
    text { '', 'if (!' },
    rep(1),
    text { ')', '\treturn (NULL);', '' },
    insert(4),
  }),
})
