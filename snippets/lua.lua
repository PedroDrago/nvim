local ls = require 'luasnip'

local snipept = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local func = ls.function_node

ls.add_snippets('lua', {
  snipept('key', {
    text "vim.keymap.set('",
    insert(1, 'Mode'),
    text "', '",
    insert(2, 'Keymap'),
    text "', ",
    insert(3, 'Action'),
    text ", { desc = '",
    insert(4, 'Description'),
    text "', silent = true })",
  }),
})
