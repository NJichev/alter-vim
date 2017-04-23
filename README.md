# alter.vim

A simple vim plugin that lets you switch fast between your code and test.

## Goals

Try to target as many languages and their conventions.

## Setup

Just use your favourite plugin manager :).

Using [vim-plug](https://github.com/junegunn/vim-plug) is simple
```vim
Plug 'njichev/alter-vim'
```

or [dein](https://github.com/Shougo/dein.vim)
```vim
call dein#add('njichev/alter-vim')
```

Add a mapping that suits you in your `.vimrc` or `init.vim` file:

```vim
nnoremap <leader>a :OpenTestAlternate<cr>
```

All credit should go to Gary Bernhardt.
