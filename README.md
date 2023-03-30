# My NeoVim Config

TODO: Add Image

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

- [todo](./docs/todo.md)
- [learning path](./docs/learning-path.md)
- [plugins](./docs/plugins/plugins-used.md) used
- [lsp](./docs/lsp.md) setup
- [nvchad vs lazyvim](./docs/nvchad-vs-lazyvim.md)
- [project specific setup](./docs/project-specific-setup.md)
- [add a new language](./docs/add-new-language.md)
- [cheatsheet.md](./docs/cheatsheet.md)

## Making Changes

The config is inspired from `lazyvim`, `nvchad` and
[folke's config](https://github.com/folke/dot/blob/master/nvim/README.md) configs. Refer to the repos in case of doubts.

- to add a new language support, check [this](./docs/add-new-language.md) doc
- config which need to be touched frequently is under `lua/props`
- always check `lua/plugins/example.lua` for examples
