SHELL = /bin/bash
DIR=$(PWD)

buildd:
	docker build . -t my/nvim

rund:
	docker run --rm -it -v $(DIR):/root/.config/nvim my/nvim

.PHONY: alt
alt:
	./alt.sh
