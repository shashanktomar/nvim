FROM alpine:edge

WORKDIR /root
RUN apk add git nodejs neovim ripgrep fd fzf alpine-sdk --update
CMD [ "/bin/sh" ]
