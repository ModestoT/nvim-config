# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Set up steps

- Install Ubuntu WSL instance on your windows 11 machina if not already installed in powershell wsl --install
- Install neovim
  - wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
  - tar xzvf nvim-linux64.tar.gz
  - create .config directory mkdir ~/.config
  - clone this repo into the config folder git clone https://github.com/ModestoT/nvim-config.git
  - rename cloned folder to nvim mv nvim-config/ nvim
- Download [Neovide](https://neovide.dev/index.html)
  - Update the neovide config file to have neovide run through WSL [here](https://neovide.dev/config-file.html)
  - install rust with rustup on both [windows and WSL](https://rustup.rs/)

## Set up clipboard

- Neovim is set up to already check if we are in a WSL env and if we are to use a different method for the clipboard
- for this to work correctly you must create a nvim_paste shell script (only needed if using WSL)
- Below is the script added to options to handle copy/paste
  `
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
end`
- Create a nvim_paste shell script in a area that is exposed to the global $PATH (mine is located in .local/bin)
- Add the following script to handle pasting
  `
  #!/bin/sh

powershell.exe Get-Clipboard | tr -d '\r' | sed -z '$ s/\n$//'`

- This will handle pasting and removing extra lines from UNIX env
