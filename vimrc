"============================================================
" copied from nopkat settings
"============================================================
syntax on
color dracula
" set smartindent
set clipboard=unnamed " use os clipboard
set expandtab
set shiftwidth=2
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing " set expandtab " tab to spaces
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
set backspace=indent,eol,start

"============
" my own settings
"============
" sets leader key to comma
let mapleader=","
set timeout timeoutlen=1500
"
" Lets vim look in bundle folder for plugins
set runtimepath^=~/.vim/bundle/vim-rubocop

" sets tab name as name of file and shows + sign  if file is modified
set guitablabel=\[%N\]\ %t\ %M

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Change RuboCop trigger to leader key + r
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

" Map RuboCop command to its yaml file
let g:vimrubocop_config = '/usr/local/lib/ruby/gems/2.4.0/gems/rubocop-0.49.1/config/default.yml' 

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
Plug 'Valloric/YouCompleteMe'

call plug#end()

