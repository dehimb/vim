" Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rking/ag.vim'
Plugin 'maksimr/vim-jsbeautify'

call vundle#end()            " required
filetype plugin indent on    " required

:let mapleader = ","
set relativenumber

" Map ESC
inoremap jk <esc>
" navigation 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>v :e ~/.vim/vimrc<CR>
nnoremap <leader>V :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>a :Ag!<space>
nnoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m <esc>:tabnext<CR>

" close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <leader>c :nohl<CR>

" undo settings
set undodir=~/.vim/tmp/undo//
set undofile
set history=100
set undolevels=100
" set backspace normal behaviour
set bs=2

" Indentations for js, html and css files
au BufNewFile,BufRead *.js, *.html, *.css:
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" color bad spaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set nu
" Tree browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set clipboard=unnamed

colorscheme meta5 

" transparent bg
hi Normal guibg=NONE ctermbg=NONE

" cursor line highlight when enter editing mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" enable syntax highligh
:syntax on
