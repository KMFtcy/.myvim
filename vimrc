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


" =========================
" setting for coc.nvim

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-l> coc#refresh()
else
  inoremap <silent><expr> <C-l> coc#refresh()
endif
" =========================

" 设置主题
set termguicolors
colorscheme codedark
