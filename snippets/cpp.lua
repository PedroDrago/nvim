local ls = require 'luasnip'
local extras = require 'luasnip.extras'

local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local choice = ls.choice_node
local func = ls.function_node
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt
local lambda = extras.lambda
-- DOC: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

local ret_filename = function()
  return vim.fn.expand '%'
end

local get_header_define = function()
  local str = ret_filename()
  return str.upper(str:gsub('%.', '_'))
end

local get_class_name = function()
  local str = ret_filename()
  local trimmed_str = str.match(str, '(.-)%.') or str
  local capitalized = trimmed_str:gsub('^%l', string.upper) or str
  return capitalized
end

local class_name = get_class_name()
local header_define = get_header_define()

ls.add_snippets('cpp', {
  snippet(
    'classh',
    fmt(
      '#ifndef {}\
#define {}\
class {} {{\
private:\
protected:\
public:\
\t{}();\
\t{}({} &src);\
\t{} &operator = ({} &src);\
\t~{}();\
}};\
#endif',
      {
        text(header_define),
        text(header_define),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
      }
    )
  ),
})

ls.add_snippets('cpp', {
  snippet(
    'classp',
    fmt(
      '#include "{}.hpp"\
      \
{}::{}(){{}};\
{}::{}({} &src){{}}\
{} &{}::operator=({} &src){{}}\
{}::~{}(){{}};\
',
      {
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
        text(class_name),
      }
    )
  ),
})
-- ls.add_snippets('cpp', {
--   snippet(
--     'class',
--     fmt(
--       '#ifndef {upper}_HPP\
-- #define {upper}_HPP\
-- class {}{{\nprivate:\
-- public:\
-- \t{capitalized}();\
-- \t{capitalized}({capitalized} &src);\
-- \t{capitalized} &operator = ({capitalized} &src);\
-- \t~{capitalized}();\
-- }};\
-- #endif',
--       {
--         insert(1, 'Name'),
--         upper = lambda(lambda._1:upper(), 1), -- NOTE: setter = l(l._1:sub(1,1):upper() .. l._1:sub(2,-1)))
--         -- lower = l(l._1:lower(), 1), -- NOTE: setter = l(l._1:sub(1,1):upper() .. l._1:sub(2,-1)))
--         capitalized = lambda(lambda._1:sub(1, 1):upper() .. lambda._1:sub(2, -1), 1),
--       }
--     )
--   ),
-- })

ls.add_snippets('cpp', {
  snippet('mainn', {
    text { 'int main(int argc, char *argv[]) {' },
    text { '', '\t' },
    insert(1),
    text { '', '\treturn 0;' },
    text { '', '}' },
  }),
})

ls.add_snippets('cpp', {
  snippet('main', {
    text { 'int main() {' },
    text { '', '\t' },
    insert(1),
    text { '', '\treturn 0;' },
    text { '', '}' },
  }),
})

ls.add_snippets('cpp', {
  snippet('endl', {
    text { 'std::endl;' },
  }),
})
