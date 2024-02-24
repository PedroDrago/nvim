local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 5, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 4, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
}

which_key.setup(setup)
which_key.register({
    S = {
        name = "Spectre"
    },
  h = "which_key_ignore",
  l = "which_key_ignore",
  a = "which_key_ignore",
  w = "which_key_ignore",
}, { prefix = "<leader>" })
