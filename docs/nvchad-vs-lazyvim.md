# NvChad vs Lazyvim

This covers `nvchad` version `2.x`

## Setup Differences

### NvChad
- wants you to clone the repo and use it as your nvim entrypoint without removing `.git` folder 
- for updates `nvchad` pull the upstream, This means you have to manage two git upstreams, your and nvchad's to update it later. Not sure if this is a good thing or bad.
- the `init.lua` file is provided by `NvChad` and your config sits under `lua/custom/`
- to extend `nvchad` the user should use 2 files in the custom dir (`chadrc.lua` and `init.lua`) and a `plugins` folder

### Lazyvim
- provides you a `starter` git repo, you clone it but manage it by yourself onwards, i.e. their is no git upstream other than yours.
- this starter package setup `lazy.nvim` and uses `lazyvim` as a plugin. This means the update to `lazyvim` are managed like any other plugin.
- `lazy.nvim` is hooked to use other plugins from within `lazyvim`

## Bootstrap Sequence

### NvChad

The bootstrap sequence is nicely explained [here](https://nvchad.com/docs/config/walkthrough). Here is the high level overview of what happens when the `~/.config/nvim/init.lua` is loaded by `nvim`.

- load `core/init` which 
  - loads globals, nvim options, commands, autocmds
  - load the nvchad `core/default_config`, which is merged with the user `chadrc.lua` config
- user `custom/init.lua` is loaded. Custom user plugins are not part of this.
- mappings are loaded and user mappings are merged with it
- one time init checks happen
  - install `lazy.nvim` if it is missing
  - suggest an install for example custom template
- plugins are loaded, both from `nvchad` and user plugins through `lazy.nvim`

### Lazyvim

From the user perspective, the bootstrap sequence is very simple. Here is the high level overview of what happens when the `~/.config/nvim/init.lua` is loaded.

- it loads `config/lazy.lua` which install the `lazy.nvim` and setup two plugins target inside it, `lazyvim` plugins folder and user `plugins` folder.
- rest of the setup happen inside `lazyvim` plugin
  - check `lazyvim/config/init.lua`, it's setup is being called
  - it first load `lazyvim` autocmds, options and keymaps, then same for the user
  - plugins directory is loaded by the starter template directly into `lazy.nvim` and not by `lazyvim` scripts

## Reasons for picking `lazyvim` over `nvchad`
- lazyvim is a much simpler setup
- lazyvim is maintained by `folke` who maintain lot of popular `nvim` plugins
- NvChad add lot of ui related plugins which only work with NvChad, this is a major dependency without much community support
