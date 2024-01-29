# Todo

- [ ] Consertar Go to Declaration/Go to Definition (ir para a propria função ao inves do header file)
- [ ] Consider Oil.nvim instead of nvim tree
- [ ] Vim.maximizer for split panels
- [ ] Consider Spectre for global find n replace

```lua
nnoremap("S", function()
    local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
    local keys = vim.api.nvim.nvim_replace_termcodes(cmd, true, false, true)
    vim.api.nvim_feedkeys(keys, "n", false)
end)
```

```lua
nnoremap("<leader>S", function()
    require("spectre").toggle()
end)
```
