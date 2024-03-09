# Nvim

These are my neovim Configs

<p align="center">
    <img src="./print.png"/>
</p>

<details><summary><b>Make your Config</b></summary>

If you're too lazy to build your configs from scratch and don't want a bloated distribution like [LunarVim](https://www.lunarvim.org/) or [NvChad](https://nvchad.com/) I strongly recommend just using [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Also watch [TeeJ video](https://www.youtube.com/watch?v=m8C0Cq9Uv9o) about Kickstart.

If you want to learn how to create from scratch your own neovim configuration files I recommend 2 sources to learn:

1. This [Typecraft Playlist](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) will guide you to make a good modularized neovim config, but won't teach you much how neovim configuration really works.

2. [Kickstart](https://github.com/nvim-lua/kickstart.nvim) `init.lua`. Reading the comments left there by TeeJ will teach you basically everything you need to know to start tweaking your configs.

</details>

### Install 
**Warning: This command will delete your current `/nvim` directory, be careful**
```bash
rm -rf ~/.config/nvim && git clone git@github.com:PedroDrago/nvim.git ~/.config/nvim
```

**Obs: If you want to use my neovim config I recommend deleting all ignored entries in [which-key.lua](./lua/plugins/whichkey.lua), this will help you learn my keymaps. Just delete all lines that have `"which_key_ignore"`**
