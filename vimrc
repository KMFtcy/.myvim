" =========================
"  _ __ ___  _   ___   _(_)_ __ ___
" | '_ ` _ \| | | \ \ / / | '_ ` _ \
" | | | | | | |_| |\ V /| | | | | | |
" |_| |_| |_|\__, | \_/ |_|_| |_| |_|
"            |___/
"
" My personal vim config. I know there is already tons of vim settings outside
" here, but I also believe a vimer should not stop adjusting his/her own vim
" settings until his/her vim-sword sharp and convenient enough to themselves!
" It's lots of fun and even a bit romantic!
" =========================


" =========================
" Global settings
" =========================
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


" =========================
" Plugin list
" =========================
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }
Plug 'ludovicchabant/vim-gutentags'

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

"
" =========================
" some basic mappings
" =========================
nnoremap <C-s> :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>t :terminal<CR>
inoremap <C-d> <ESC>
vnoremap <C-d> <ESC>


" =========================
" setting for searching shortcut
" =========================
nnoremap <leader>fa :Leaderf rg<CR> 
nnoremap <leader>ff :Leaderf file<CR> 
nnoremap <leader>fl :Leaderf line<CR>
vnoremap <leader>fa y:Leaderf rg <C-r>"<CR>
vnoremap <leader>ff y:Leaderf file --input <C-r>"<CR> 
vnoremap <leader>fl y:Leaderf line --input <C-r>"<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_GtagsAutoGenerate = 1


" =========================
" setting for windows managemet 
" =========================
noremap <C-w>o :tabe %<CR>


" =========================
" setting for gtags and vim-gutentags
" =========================
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0


" =========================
" setting for nerdtree and nerdtree-tabs
" =========================
noremap <leader>e :NERDTreeMirrorToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1
let NERDTreeShowLineNumbers=1
" let NERDTreeAutoCenter=1
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

" =========================
" setting for git related plugin
" =========================
nnoremap <leader>gl :tabe<CR>:-tabmove<CR>:NERDTreeClose<CR>:term ++curwin ++close lazygit<CR>
nnoremap <leader>gb :Gblame<CR>

" =========================
" setting for buffer switch
" =========================
noremap <C-j> :bnext<CR>
noremap <C-k> :bprev<CR>
noremap <C-w>w :bdelete<CR>


" =========================
" setting for coc.nvim
" =========================
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
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
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" =========================
" setting for airline
" =========================
let g:airline#extensions#tabline#enabled = 1


" =========================
" setting for nerdcommenter
" =========================
let g:NERDSpaceDelims=1


" =========================
" setting for easymotion
" =========================
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings"
" Jump to anywhere with only `s{char}{target}`
" " `s<CR>` repeat last find motion.
" nmap t <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)


" =========================
" 设置主题
" =========================
set termguicolors
colorscheme codedark
