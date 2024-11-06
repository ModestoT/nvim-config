# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Set up steps

- Install Ubuntu WSL instance on your windows 11 machina if not already installed in powershell wsl --install
- Install Terminal font https://www.nerdfonts.com/font-downloads JetBrainsMono Nerd Font
- Install neovim [docs link](https://github.com/neovim/neovim/wiki/Installing-Neovim/921fe8c40c34dd1f3fb35d5b48c484db1b8ae94b#linux)
- Create .config directory mkdir ~/.config
- Clone this repo into the config folder git clone https://github.com/ModestoT/nvim-config.git
- Rename cloned folder to nvim mv nvim-config/ nvim
- If run into error `No C compiler found! "cc", "gcc", "clang", "cl", "zig" are not executable.` install on linux `sudo apt update && sudo apt install build-essential`

## Set up clipboard

- Neovim is set up to already check if we are in a WSL env and if we are to use a different method for the clipboard
- For this to work correctly you must create a nvim_paste shell script (only needed if using WSL)
- Below is the script added to options to handle copy/paste

```lua
local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
if in_wsl then
  vim.g.clipboard = {
    name = "wsl clipboard",
    copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
    paste = {
      ["+"] = { "nvim_paste" },
      ["*"] = { "nvim_paste" },
    },
    cache_enabled = true,
  }
end
```

- Create a nvim_paste shell script in a area that is exposed to the global $PATH (mine is located in .local/bin)
- Add the following script to handle pasting, this will handle pasting and removing extra lines from UNIX env
- make shell script excutable `chmod u+x nvim_paste`

```
#!/bin/sh

powershell.exe Get-Clipboard | tr -d '\r' | sed -z '$ s/\n$//'
```
