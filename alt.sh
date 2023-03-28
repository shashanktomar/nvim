#!/bin/sh

# Run nvim as alternate nvim without changing the current nvim setup

CURRENT_DIR=$(pwd)
XDG_CONFIG_HOME="$CURRENT_DIR/.."
XDG_DATA_HOME="$CURRENT_DIR/.alt/data"
XDG_CACHE_HOME="$CURRENT_DIR/.alt/cache"

mkdir -p "$XDG_DATA_HOME" "$XDG_CACHE_HOME"

exec env XDG_CONFIG_HOME="$XDG_CONFIG_HOME" \
	XDG_DATA_HOME="$XDG_DATA_HOME" \
	XDG_CACHE_HOME="$XDG_CACHE_HOME" \
	nvim
