syntax on
filetype plugin indent on
let mapleader=" "
set encoding=utf-8
set laststatus=2
set cursorline
set linebreak

set autoindent
set showmode
set number
set scrolloff=5
set tabstop=4
set shiftwidth=4
set colorcolumn=100


noremap X S
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>r :source $MYVIMRC<CR>

" setting for nerdtree
nnoremap <silent> <leader>e :NERDTreeFind<cr>

" setting for tender
" 开启 24 位真彩色支持
" 24位真彩色信息请参考 https://gist.github.com/XVilka/8346728
set termguicolors
" 设置主题
color tender
" tender 默认背景色是一种亮灰色，晚上特别不舒服，改成纯黑
highlight Normal guibg=#000001
" 改背景后选中区域无法高亮，也得调一下
highlight Visual guibg=#323232
" 灰色的状态栏很扎眼，调一下
highlight StatusLine guibg=#444444 guifg=#b3deef
" vim 的 terminal 状态栏需要单独配置
highlight StatusLineTerm guibg=#444444 guifg=#b3deef
highlight StatusLineTermNC guibg=#444444 guifg=#999999

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


hi Normal ctermfg=252 ctermbg=none
