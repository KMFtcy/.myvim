" pre-install
" 1. curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. git clone https://github.com/jacoborus/tender.vim ~/.vim/pack/vendor/start/tendor
" 
syntax on
filetype plugin indent on
set nocompatible
set incsearch
let mapleader=" "
set laststatus=2
set cursorline
set linebreak
set encoding=utf-8

set autoindent
set showmode
set relativenumber
set scrolloff=15
set tabstop=4
set shiftwidth=4

" ##########################

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'

Plug 'tomasiser/vim-code-dark'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion'

call plug#end()

" ##########################
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>t :terminal<CR>
inoremap <C-d> <ESC>
vnoremap <C-d> <ESC>

" setting for searching shortcut
nnoremap <C-f>a :Leaderf rg<CR> 
" nnoremap <C-f>a :Rg<CR> 
nnoremap <C-f>f :Leaderf file<CR> 
" nnoremap <C-f>f :Files<CR>
nnoremap <C-f>l :Leaderf line<CR>
" nnoremap <C-f>l :BLines<CR>
nnoremap <C-f>iwf yiw:Leaderf line <C-r>"<CR>
nnoremap <C-f>iwa yiw:Leaderf rg <C-r>"<CR>
vnoremap <C-f>a y:Leaderf rg <C-r>"<CR>
vnoremap <C-f>l y:Leaderf line <C-r>"<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

" setting for nerdtree and nerdtree-tabs
noremap <C-e> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
" let g:NERDTreeGitStatusIndicatorMapCustom = {
" \ "Modified" : "*",
" \ "Staged" : "",
" \ "Untracked" : "",
" \ "Renamed" : "",
" \ "Unmerged" : "═",
" \ "Deleted" : "",
" \ "Dirty" : "",
" \ "Clean" : "︎",
" \ "Unknown" : "?"
" \}

" setting for fugitive
noremap <leader>g :Git 
noremap <leader>ga :Git add .<CR>
noremap <leader>gc :Git commit<CR>
noremap <leader>gp :Git push<CR>

" setting for buffer switch
noremap <C-j> :bnext<CR>
noremap <C-k> :bprev<CR>
noremap <C-w>w :bdelete<CR>

" seting for easymotion


" =========================
" setting for coc.nvim

let g:coc_global_extensions = [ 'coc-json', 'coc-vimlsp', 'coc-sh' ]

" TextEdit might fail if hidden is not set.
set hidden

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

" Use <c-l> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-l> coc#refresh()
else
  inoremap <silent><expr> <C-l> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
              endif
              endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" =========================

" =========================
" setting for airline

let g:airline#extensions#tabline#enabled = 1

" =========================

" =========================
" setting for nerdcommenter

let g:NERDSpaceDelims=1

" =========================
" setting for easymotion
let g:EasyMotion_smartcase = 1
" =========================
" 设置主题
set termguicolors
colorscheme codedark
