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

local function ret_filename()
  return vim.fn.expand '%:t'
end

local function get_header_define()
  local str = ret_filename()
  return str:upper():gsub('%.', '_')
end

local function get_class_name()
  local str = ret_filename()
  local trimmed_str = str:match '(.-)%.' or str
  return trimmed_str:gsub('^%l', string.upper) or str
end

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
        func(get_header_define, {}),
        func(get_header_define, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
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
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
        func(get_class_name, {}),
      }
    )
  ),
})

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

ls.add_snippets('cpp', {
  snippet('op', {
    text { 'std::ostream &operator' },
    insert(1),
    text { '(std::ostream &stream, ' },
    insert(2),
    text { ');' },
  }),
})

ls.add_snippets('cpp', {
  snippet('trycatch', {
    text { 'try {', '\t' },
    insert(1),
    text { '', '} catch (std::exception &e) {', '\tstd::cout << e.what() << std::endl;' },
    insert(2),
    text { '', '}', '' },
  }),
})

ls.add_snippets('cpp', {
  snippet('exc', {
    text { 'class ' },
    insert(1),
    text { ' : public std::exception {', '' },
    text { '\tpublic: ', '' },
    text { '\t\tvirtual const char* what() const throw() {', '' },
    text { '\t\t\treturn ' },
    insert(2),
    text { ';', '' },
    text { '\t\t}', '' },
    text { '};' },
  }),
})
