#!/bin/bash
nvim --headless -c "MasonInstall lua-language-server rust-analyzer" -c qall

nvim --headless -c "MasonInstall lua-language-server rust-analyzer
black \
clang-format \
clangd \
codelldb \
fixjson \
isort \
json-lsp \
lua-language-server \
mypy \
prettier \
pyright \
rnix-lsp \
shellcheck \
shellharden \
shfmt \
stylua \
texlab \
yaml-language-server \
yamlfmt \
yamllint \
" -c qall
