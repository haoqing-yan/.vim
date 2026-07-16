# My vim config files

## Plugins

This config uses [vim-plug](https://github.com/junegunn/vim-plug).

First Vim startup will try to install `vim-plug` automatically when `curl` is available, then run `PlugInstall`. Manual install:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

Included plugins:

- `preservim/nerdtree`: file tree, toggle with `<C-n>`
- `ctrlpvim/ctrlp.vim`: fuzzy file search, open with `<C-p>`
- `vim-airline/vim-airline`: status line
- `vim-airline/vim-airline-themes`: airline themes
- `airblade/vim-gitgutter`: Git diff signs
- `tpope/vim-commentary`: comment operator, use `gcc` or `gc`
- `tpope/vim-surround`: edit surrounding quotes/brackets/tags
- `jiangmiao/auto-pairs`: auto-close pairs
- `editorconfig/editorconfig-vim`: EditorConfig support
- `prabirshrestha/vim-lsp`: language server protocol support
- `mattn/vim-lsp-settings`: install and configure language servers
- `prabirshrestha/asyncomplete.vim`: async completion framework
- `prabirshrestha/asyncomplete-lsp.vim`: LSP completion source
- `prabirshrestha/asyncomplete-buffer.vim`: current-buffer completion source
- `prabirshrestha/asyncomplete-file.vim`: file path completion source
- `easymotion/vim-easymotion`: fast visible-text jumps
- `justinmk/vim-sneak`: two-character jumps

## Completion and jump commands

- `<Tab>` / `<S-Tab>`: select next / previous completion item
- `<CR>`: accept visible completion item
- `<C-Space>`: manually trigger completion
- `gd`: go to definition
- `gD`: go to declaration
- `gi`: go to implementation
- `gr`: list references
- `gy`: go to type definition
- `<leader>lh`: hover documentation
- `<leader>lr`: rename symbol
- `<leader>lf`: format document
- `<leader>ld`: show document diagnostics
- `[d` / `]d`: previous / next diagnostic
- `<leader><leader>w`: EasyMotion word jump
- `<leader><leader>f`: EasyMotion character jump
- `<leader><leader>j` / `<leader><leader>k`: EasyMotion line jump
- `s{char}{char}` / `S{char}{char}`: Sneak forward / backward jump

LSP completion and symbol jumps require a language server for the current filetype. Run `:LspInstallServer` in Vim and choose the server you need.
