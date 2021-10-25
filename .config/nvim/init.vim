" Author: Gabriel Caussi
" Source: https://github.com/gabrielcaussi/dotfiles

" --------------- Vim-Plug ---------------

call plug#begin()

  Plug 'morhetz/gruvbox'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'yggdroot/indentline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ap/vim-css-color'

call plug#end()

" --------------- Basic Setup ---------------

syntax on
set confirm
set number relativenumber
set mouse=a
set lazyredraw
set cursorline
set clipboard=unnamedplus
set colorcolumn=80
set hlsearch
set ignorecase
set smartcase
set encoding=UTF-8
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2
set hidden
set nobackup
set nowritebackup
set noswapfile
set wildmenu
set wildmode=list:longest
set incsearch
set nowrap
set autoread

" --------------- Plugins Settings ---------------

" Theme
set termguicolors
colorscheme gruvbox
set background=dark

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <c-b> <ESC>:NERDTreeToggle<CR>

" NERDCommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert

" Indentline
let g:identLine_enabled=1
nnoremap <c-k> :IndentLinesToggle<CR>

" Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" --------------- Keyboard Shortcuts ---------------

" Map leader key as space
let mapleader="\<space>"

" Leader key shortcuts
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>; A;<ESC>

" Switch tabs (M = Alt on linux)
nnoremap <c-x> :bp\|bd #<CR>
nnoremap <M-l> :bn<CR>
nnoremap <M-h> :bp<CR>

" Other shortcuts
nnoremap q :quit<CR>
nnoremap w :write<CR>
nnoremap <c-q> :q!<CR>
nnoremap <c-s> :wq<CR>
nnoremap <M-d> :PlugInstall<CR>
