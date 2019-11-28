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
Plugin 'PProvost/vim-ps1'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'brooth/far.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'beautify-web/js-beautify'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'sheerun/vim-polyglot'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd BufNewFile,BufRead *.js.phtml set filetype=javascript

let mapleader = ","
" set relativenumber

" Map ESC
inoremap jk <esc>

" paste toggle
set pastetoggle=<F2>

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
map <leader>r :source ~/.vim/vimrc<CR>

" UltiSnip/YouCompleteMe
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]
let g:ycm_complete_in_strings = 0
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<NUL>"
let g:ulti_expand_or_jump_res = 0
let g:ycm_filetype_whitelist = { 'python': 1, 'javascript': 1, 'go': 1 }
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

"omni
" set completeopt=menuone,noinsert,noselect
" :imap <C-@> <C-Space>
" :imap <C-Space> <C-x><C-o>

" close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

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

autocmd BufNewFile,BufRead *.* setlocal noexpandtab tabstop=4 shiftwidth=4 

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" color bad spaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set nu
" Tree browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set clipboard=unnamed
colorscheme meta5 

" cursor line highlight when enter editing mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" always show current filename
set laststatus=2

" enable syntax highligh
:syntax on

" airline
let g:airline#extensions#tabline#enabled = 1

" ctrl space
set hidden
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" go-vim
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_autodetect_gopath = 1

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>l :GoMetaLinter<CR>
autocmd FileType go nmap <Leader>sc :GoCallees<CR>
autocmd FileType go nmap <Leader>sr :GoReferrers<CR>
autocmd FileType go nmap <Leader>si :GoImplements<CR>
autocmd FileType go nmap <Leader>sd :GoDeclsDir<CR>

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

if executable("ag")
	let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Tagbar
noremap <leader>st :Tagbar<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }

" Prettier default: 2
let g:prettier#config#tab_width = 4
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'false'
