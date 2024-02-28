# Nvim

These are my neovim Configs

<p align="center">
    <img src="./print.png"/>
</p>

This configuration is based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), but with my own tweaks and a lot of [extra plugins](./plugins.md).

If you're too lazy to build your configs from scratch and don't want a bloated distribution like [LunarVim](https://www.lunarvim.org/) or [NvChad](https://nvchad.com/) I strongly recommend just using kickstart.

If you want to learn how to create from scratch your own neovim configuration files I recommend 2 sources to learn:
1. This [Typecraft Playlist](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) will guide you to make a good modularized neovim config, but won't teach you much how neovim configuration really works.
2. [Kickstart](https://github.com/nvim-lua/kickstart.nvim) has TONS of comments explaining each decision in the config, and they're all in a single file, which makes a lot easier to read, it is like reading a practical tutorial. In my opinion it is the best place to learn how neovim configurations are built.

### Install 
**Warning: This command will delete your current `/nvim` directory, be careful**
```bash
rm -rf ~/.config/nvim && git clone git@github.com:PedroDrago/nvim.git ~/.config/nvim
```

**Obs: If you want to use my neovim config I recommend deleting all `which_key_ignore` entries in `nvim/lua/plugins/which-key.lua`. That will help you learning my keymaps. Just delete all lines that have `which_key_ignore`**
