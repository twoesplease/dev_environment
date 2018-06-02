"============================================================
" general settings 
"============================================================
syntax on
" set smartindent
set background=dark
color dracula
set clipboard=unnamed " use os clipboard
set number " show line numbers
set ruler " Show line, column number, and relative position within a file in the status line
set cursorline  " highlight current line
set cursorcolumn "highlight current column
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set ignorecase " ignore case when searching
set hlsearch " highlight matches
set backspace=indent,eol,start " makes backspace less annoying
set noerrorbells " no sound on errors
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language 
let g:rainbow_active = 1 "turns on rainbow parens.  set to 0 if you want to enable it later via :RainbowToggle

" sets leader key to comma
let mapleader=","
set timeout timeoutlen=1500

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader>cr :noh<cr>

" nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

set guitablabel=\[%N\]\ %t\ %M " sets tab name as name of file and shows + sign  if file is modified


" Remap jj to escape in insert mode.
inoremap jj <esc>
nnoremap JJJJ <nop
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo.go

"------------------------------------------------------------------------------
" Text, tab and indent related
"------------------------------------------------------------------------------

set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
set shiftround " Round indent to multiple of 'shiftwidth' for > and < commands

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing ' set expandtab ' tab to spaces

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Don't Wrap lines

"------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"============================================================
" RuboCop
"============================================================
" Change RuboCop trigger to leader key + r
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" Map RuboCop command to its yaml file
let g:vimrubocop_config = '/usr/local/lib/ruby/gems/2.4.0/gems/rubocop-0.49.1/config/default.yml' 

" Add spaces after comment delimiters with NERDCommenter
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Open NERDTree with :NT rather than :NERDTree
:command NT NERDTree

"------------------------------------------------------------------------------
" Vim-go
" settings via https://github.com/farazdagi/vim-go-ide/blob/master/vimrc/plugins.vim 
"------------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
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

"============================================================
"fold based on indent
"============================================================

set foldmethod=indent   
set foldnestmax=10
" makes it so that files aren't folded when opened
set nofoldenable
set foldlevel=2

"============================================================
"vim-plug additions
"============================================================

"required for NERDCommenter to work
"" - see its Github README
filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutterPlug'
Plug 'luochen1990/rainbow'

call plug#end()

"============================================================
"vim-pathogen additions
"============================================================

execute pathogen#infect()
