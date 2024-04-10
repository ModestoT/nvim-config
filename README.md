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
