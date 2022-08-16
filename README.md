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

- `make build` to build the docker image
- `make run` to bring up docker. Then run `nvim`
