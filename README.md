# My NeoVim Config

TODO: Add Image

This was forked from `lazyvim` [repo](https://github.com/LazyVim/starter).

- `lazy.nvim` is the plugin manager that is at the root of this setup
- `lazyvim` is a quick starter boilerplate off which this is based.

## Try in docker

### Directly in Docker

Try with docker without cloning repo:

```sh
docker run -w /root -it --rm alpine:edge sh -uelic '
    apk add git nodejs neovim ripgrep fd fzf alpine-sdk --update
    git clone https://github.com/shashanktomar/nvim ~/.config/nvim
    nvim
    '
```

### After cloning the repo

- `make buildd` to build the docker image
- `make rund` to bring up docker. Then run `nvim`

## Run on local machine as an alternate nvim setup

Check this [video](https://www.youtube.com/watch?v=LkHjJlSgKZY)

## Docs

- [plugins used](./docs/plugins.md)
- [todo](./docs/todo.md)
- [practice routine](./docs/practice-routine.md)
- [learning path](./docs/learning-path.md)
- [nvchad vs lazyvim](./docs/nvchad-vs-lazyvim.md)
- [project specific setup](./docs/project-specific-setup.md)
- [cheatsheet.md](./docs/cheatsheet.md)

## Making Changes

The config is inspired from `lazyvim`, `nvchad` and
[folke's](https://github.com/folke/dot/blob/master/nvim/README.md) configs. Refer to the repos in case of doubts.

- to add a new language support, check [this](./docs/add-new-language.md) doc
- config which need to be touched frequently is under `lua/props`
- always check `lua/plugins/example.lua` for examples and read <https://lazy.folke.io/> docs
