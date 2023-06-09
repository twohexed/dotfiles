set nocompatible
filetype on
filetype plugin on
filetype indent on
" set cursorline
set showmode
set showmatch
set history=2
set ignorecase
set number
set wrap
syntax enable
set incsearch
set hlsearch
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
nnoremap <F3> :nohlsearch<CR>

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
