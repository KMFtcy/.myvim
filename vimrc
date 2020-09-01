" pre-install
" 1. curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. git clone https://github.com/jacoborus/tender.vim ~/.vim/pack/vendor/start/tendor
" 
syntax on
filetype plugin indent on
let mapleader=" "
set laststatus=2
set cursorline
set linebreak
set encoding=utf-8

set autoindent
set showmode
set number
set scrolloff=5
set tabstop=4
set shiftwidth=4

" ##########################

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'

Plug 'tomasiser/vim-code-dark'

call plug#end()

" ##########################
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>r :source $MYVIMRC<CR>

" setting for fzf
nmap <C-p> :Files<CR>

nmap <C-e> :Buffers<CR>

" setting for nerdtree
map <C-n> :NERDTreeToggle<CR>

" setting for fugitive
nmap <leader>g :Git 

" 设置主题
set termguicolors
colorscheme codedark
