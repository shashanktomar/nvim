FROM alpine:edge

WORKDIR /root
RUN apk add git lazygit neovim ripgrep fd fzf alpine-sdk --update
CMD [ "/bin/sh" ]
