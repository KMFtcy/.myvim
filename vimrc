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

set updatetime=400


" =========================
" Plugin list
" =========================
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

Plug 'tpope/vim-fugitive'

Plug 'dracula/vim', { 'as': 'dracula'  }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'easymotion/vim-easymotion'

call plug#end()

"
" =========================
" some basic mappings
" =========================
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>t :top terminal<CR>


" =========================
" setting for searching shortcut
" =========================
nnoremap <leader>fa :Leaderf rg<CR> 
nnoremap <leader>fb :Leaderf buffer<CR> 
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

" =========================
" setting for Defx 
" =========================
nnoremap <silent> <leader>ee
            \ :<C-u>Defx -toggle -buffer-name=tab`tabpagenr()` <CR>
nnoremap <silent> <leader>ea
            \ :<C-u>Defx -buffer-name=tab`tabpagenr()` -toggle -search=`expand('%:p')`<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ? 
                \ defx#do_action('open_or_close_tree') : 
                \ defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> i
                \ defx#do_action('multi',[['drop','split']])
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> n
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
   nnoremap <silent><buffer><expr> !
			   \ defx#do_action('execute_command')
   nnoremap <silent><buffer><expr> yy
               \ defx#do_action('yank_path')
   nnoremap <silent><buffer><expr> q
			   \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
   nnoremap <silent><buffer><expr> ~
			   \ defx#do_action('change_vim_cwd')
endfunction 
call defx#custom#option('_', {
            \ 'columns': 'indent:git:icons:filename:type',
            \ 'winwidth': 35,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 0,
            \ 'root_marker': '≡ ',
            \ 'ignored_files':
            \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
            \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
            \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

" =========================
" setting for git related plugin
" =========================
nnoremap <leader>gl :tabe<CR>:-tabmove<CR>:term ++curwin ++close lazygit<CR>
nnoremap <leader>gb :Gblame<CR>


" =========================
" setting for buffer switch
" =========================
noremap <leader>bn :bnext<CR>
noremap <leader>bp :bprev<CR>
noremap <leader>bd :bdelete<CR>


" =========================
" setting for coc.nvim
" =========================
let g:coc_global_extensions = [ 'coc-json', 'coc-vimlsp', 'coc-sh', 'coc-yank', 'coc-git', 'coc-yaml', 'coc-python', 'coc-ci', 'coc-snippets']

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set number
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" =========================
" setting for coc-snipaste
" =========================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

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
" Jump to anywhere with only `t{char}{target}`
map ; <Plug>(easymotion-s)


" =========================
" setting for coc-git
" =========================
" navigate chunks of current buffer
nmap <leader>gp <Plug>(coc-git-prevchunk)
nmap <leader>gn <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <leader>gd <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>gc <Plug>(coc-git-commit)
nmap <leader>gs :CocCommand git.chunkStage<CR>
" undo current change
nmap <leader>gu :CocCommand git.chunkUndo<CR>


" =========================
" setting for coc-yank
" =========================
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <leader><leader>yc  :CocCommand yank.clean<cr>


" =========================
" setting for coc-highlight
" =========================
autocmd CursorHold * silent call CocActionAsync('highlight')


" =========================
" setting for coc-list
" =========================
nnoremap <silent> <leader>l :<C-u>CocList<CR>


" =========================
" 设置主题
" =========================
set termguicolors
colorscheme dracula 
