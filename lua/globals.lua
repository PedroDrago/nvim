vim.loader.enable()
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '
g.linting = false

local function transparent()
  local path = vim.fn.stdpath 'config' .. '/TRANSPARENT.env'
  local file = io.open(path, 'r')

  if not file then
    return false -- default to false if file not found
  end

  local value = file:read '*l' -- read the first line
  file:close()

  return value == 'TRUE'
end

g.transparent = transparent()
