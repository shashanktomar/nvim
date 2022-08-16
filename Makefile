SHELL = /bin/bash
DIR=$(PWD)

build:
	docker build . -t my/nvim

run:
	docker run --rm -it -v $(DIR):/root/.config/nvim my/nvim 
