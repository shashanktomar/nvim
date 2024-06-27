# Cheatsheet

If something doesn't seem right, first thing you should do it run healthcheck for the plugin with
`checkhealth <plugin-name>`. Example `checkhealth telescope`.

## Vim

- folding: check `:h folding`
  - `:set foldmethod?` to check current value
  - manual folding example
    - `zf'a` will fold from the current line to wherever the mark `a` has been set
    - `zf3j` folds the current line along with the following 3 lines
    - if you want to create folds in a text file that uses curly braces (json files) to delimit code blocks ({...}), 
    you can use the command `zfa}` to create a fold for the current code block.


## Plugins

- telescope
  - `:telescope builtin` to see a list of builtin pickers
  - help is `<C-/>` in `insert` mode and `?` in `normal` mode
  - check `:h telescope.setup` for available configuration
- which-key
  - use `z=` for spelling suggestions
- lsp
  - jsonls
    - if schema is not auto-detected using filename, you can add to `$schema` field as described in
      [nvim-lspconfig](./plugins/nvim-lspconfig.md) doc
