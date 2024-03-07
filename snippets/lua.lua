local ls = require 'luasnip'
local extras = require 'luasnip.extras'

local snipept = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local func = ls.function_node
local rep = extras.rep

ls.add_snippets('lua', {
  snipept('note', {
    text '-- NOTE: ',
    insert(0),
  }),
})
ls.add_snippets('lua', {
  snipept('fix', {
    text '-- FIX: ',
    insert(0),
  }),
})
ls.add_snippets('lua', {
  snipept('todo', {
    text '-- TODO: ',
    insert(0),
  }),
})
ls.add_snippets('lua', {
  snipept('warn', {
    text '-- WARN: ',
    insert(0),
  }),
})
ls.add_snippets('lua', {
  snipept('test', {
    text '-- TEST: ',
    insert(0),
  }),
})
