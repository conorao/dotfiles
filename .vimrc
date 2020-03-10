" Conor Odell | github.com/conorao

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Set 80 character ruler
set cc=80
" Show cursor position
set ruler
" Height of command window
set cmdheight=2
" Syntax highlighting
syntax enable
" Colorscheme
colorscheme desert
set background=dark
" Set line numbers
set nu
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
