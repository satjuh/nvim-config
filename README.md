## Introduction

Neovim configuration used for code editing with automatic formatting and LSP:s configure (lua, go, python, rust, react, c++, ...).


## Requirements
- neovim >= 0.9.5 (due to some plugins)
- ripgrep
- rust tooling (unless you disable rust analyzer, ruff)
- node and npm (for plugins)
- python3 and pip


### Installation

- on Linux and Mac
```sh
git clone https://github.com/satjuh/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```


### Post Installation

Start Neovim

```sh
nvim
```

The `Lazy` plugin manager will start automatically on the first run and install the configured plugins - as can be seen in the introduction video. After the installation is complete you can press `q` to close the `Lazy` UI and **you are ready to go**! Next time you run nvim `Lazy` will no longer show up.

If you would prefer to hide this step and run the plugin sync from the command line, you can use:

```sh
nvim --headless "+Lazy! sync" +qa
```
