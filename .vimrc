" Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rking/ag.vim'
Plugin 'sjl/gundo.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

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
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :tabnew ~/.vimrc<CR>
nnoremap <leader>a :Ag!<space>
nnoremap <F4> :GundoToggle<CR>
nnoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m <esc>:tabnext<CR>

" close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" sessions
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :SessionOpen<CR>
nnoremap <leader>ss :SessionSave<space>
nnoremap <leader>sd :SessionDelete<CR>
nnoremap <leader>sc :SessionClose<CR>

" powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
" disaple autopep8 diff window
let g:autopep8_disable_show_diff=1

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

" Enable PEP8 standart indentation for python
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
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

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

set clipboard=unnamed

let python_highlight_all=1
syntax on
colorscheme meta5 

" transparent bg
hi Normal guibg=NONE ctermbg=NONE
