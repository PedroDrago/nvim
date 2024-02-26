# Nvim

These are my neovim Configs, they are my revamp on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). 

<p align="center">
    <img src="./config_printscreen.png"/>
</p>

If you're too lazy to build your configs from scratch and don't want a bloated distribution like [LunarVim](https://www.lunarvim.org/) or [NvChad](https://nvchad.com/) I strongly recommend just using kickstart.

If you want to learn how to create from scratch your own neovim configuration files I recommend 2 sources to learn:
1. This [Typecraft Playlist](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) will guide you to make a good modularized neovim config, but won't teach you much how neovim configuration really works.
2. [Kickstart](https://github.com/nvim-lua/kickstart.nvim) has TONS of comments explaining each decision in the config, and they're all in one single file, which makes a lot easier to read and lear, it is like reading a practical tutorial. It is the best place to learn how plugins are loaded, required, configured, lazy loaded etc, and how neovim deals with config files.

### Install 
**Warning: This command will delete your current `/nvim` directory, be careful**
```bash
rm -rf ~/.config/nvim && git clone git@github.com:PedroDrago/nvim.git ~/.config/nvim
```
