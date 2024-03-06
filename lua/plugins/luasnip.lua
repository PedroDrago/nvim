return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  build = (function()
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  config = function()
    local ls = require 'luasnip'
    ls.config.set_config {
      history = true,
      pdateevents = 'TextChanged,TextChandeI',
      auto_snippets = true,
    }
    local snipept = ls.snippet
    local text = ls.text_node
    local insert = ls.insert_node
    local choice = ls.choice_node
    local func = ls.function_node
    --Golang
    ls.add_snippets('go', {
      snipept('ifer', {
        text 'if err != nil {',
        text { '', '\t' },
        insert(1),
        text { '', '}' },
      }),
    })
    ls.add_snippets('go', {
      snipept('f', {
        text 'func ',
        insert(1),
        text '(',
        insert(2),
        text ') ',
        insert(3),
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
        insert(1),
        text ') ',
        insert(2),
        text '(',
        insert(3),
        text ') ',
        insert(4),
        text { ' {', '\t' },
        insert(5),
        text { '', '}' },
      }),
    })
    --C
    ls.add_snippets('c', {
      snipept('main', {
        text 'int main(int argc, char *argv[]){',
        text { '', '\t' },
        insert(1),
        text { '', '', '\treturn 0;' },
        text { '', '}' },
      }),
    })
    ls.add_snippets('c', {
      snipept('ifnul', {
        text 'if (!',
        insert(1),
        text { ')', '\treturn(NULL);' },
      }),
    })
    ls.add_snippets('c', {
      snipept('vd', {
        text '(void) ',
        insert(1),
        text { ';' },
      }),
    })
  end,
}
