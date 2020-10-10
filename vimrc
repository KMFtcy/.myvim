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
set tabstop=2
set shiftwidth=2
set updatetime=400
" The ^= syntax for :set prepends the directory name to the head of the list, so Vim will check that directory first.
" The // at the end of the directory name tells Vim to use the absolute path to the file to create the swap file so there aren't collisions between files of the same name from different directories.
set directory^=$HOME/.vim/tmp//


" =========================
" Plugin list
" =========================
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'liuchengxu/vista.vim'

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

Plug 'brooth/far.vim'

Plug 'francoiscabrol/ranger.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'Yggdroot/indentLine'

Plug 'airblade/vim-rooter'

Plug 'luochen1990/rainbow'

Plug 'ryanoasis/vim-devicons'

Plug 'pechorin/any-jump.vim'

" this plugin help me to support mouse operation and forget paste mode
" Plug 'wincent/terminus'

Plug 'troydm/zoomwintab.vim'

Plug 'wesQ3/vim-windowswap'

call plug#end()


" =========================
" some basic mappings
" =========================
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>tt :top terminal<CR>


" =========================
" setting for searching shortcut
" =========================
nnoremap <leader>fa :Leaderf rg<CR> 
nnoremap <leader>fb :Leaderf buffer<CR> 
nnoremap <leader>ff :Leaderf file<CR> 
nnoremap <leader>fl :Leaderf line<CR>
nnoremap <leader>ft :Leaderf tag<CR>
vnoremap <leader>fa y:Leaderf rg <C-r>"<CR>
vnoremap <leader>ff y:Leaderf file --input <C-r>"<CR> 
vnoremap <leader>fl y:Leaderf line --input <C-r>"<CR>
vnoremap <leader>ft y:Leaderf tag --input <C-r>"<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
let g:Lf_CacheDirectory = expand('~')
let g:Lf_RootMarkers = ['.root', '.svn', '.git', '.hg', '.project'] 
let g:Lf_WorkingDirectoryMode = 'ac'
let g:Lf_Gtagslabel = "native-pygments"
let g:Lf_Gtagsconf = "/usr/local/share/gtags/gtags.conf"


" =========================
" setting for searching shortcut
" =========================
let g:any_jump_disable_default_keybindings = 1
" Normal mode: Jump to definition under cursore
nnoremap <leader>j :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>


" =========================
" setting for windows managemet 
" =========================
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>wy :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>wp :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>"


" =========================
" setting for session management
" =========================
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_always = 1


" =========================
" setting for rainbow
" =========================
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"


" =========================
" setting for indent guide
" =========================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '¦'
let g:indentLine_enabled = 1


" =========================
" setting for Ranger in vim
" =========================
nnoremap <leader>er :RangerWorkingDirectoryExistingOrNewTab<CR>
" let g:ranger_replace_netrw = 1
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'


" =========================
" setting for vim-rooter
" =========================
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
let g:rooter_resolve_links = 1
" let g:rooter_silent_chdir = 1


" =========================
" setting for Far
" =========================
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
" shortcut for far.vim find
" nnoremap <silent>   :Farf<cr>
" vnoremap <silent> <Find-Shortcut>  :Farf<cr>
" shortcut for far.vim replace
nnoremap <silent> <leader>s  :Farr<cr>
vnoremap <silent> <leader>s  :Farr<cr>
" enable undo in far
let g:far#enable_undo=1
" some extra setting
let g:far#source='rg'
let g:far#preview_window_height=20
let g:far#collapse_result=1
let g:far#mapping = {
	\ "stoggle_expand_all" : "<space>",
	\ "quit" : "q",
	\ "stoggle_exclude" : "a",
	\  "stoggle_exclude_all" : "A",
	\ "open_preview" : "p",
	\ "close_preview" : "P",
	\ }


" =========================
" setting for gtags and vim-gutentags
" =========================
set tags=./.tags;,.tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.cache/tags')
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxc']
let g:gutentags_ctags_extra_args += ['--c-kinds=+pxc']
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" disable gutentags_plus default map
let g:gutentags_plus_nomap = 1
  " :GscopeFind {querytype} {name}
  " 0 or s: Find this symbol
  " 1 or g: Find this definition
  " 2 or d: Find functions called by this function
  " 3 or c: Find functions calling this function
  " 4 or t: Find this text string
  " 6 or e: Find this egrep pattern
  " 7 or f: Find this file
  " 8 or i: Find files #including this file
  " 9 or a: Find places where this symbol is assigned a value
nnoremap <silent> <leader>ts :GscopeFind s <C-R><C-W><cr>
vnoremap <silent> <leader>ts y:GscopeFind s <C-R>"<cr>
" the following two keymaps implements: switch to quickfix window and press p,
" the item under cursor will be displayed in the preview window immediately,
" When you finished, just use P (upper case) or CTRL+W z to close the preview
" window
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


" =========================
" setting for vista
" =========================
" 
" <CR>  - jump to the tag under the cursor.
" p     - preview the tag under the context via the floating window if it's
        " avaliable.
" s     - sort the symbol alphabetically or the location they are declared.
" q     - close the vista window.
"
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" set shortcut
nnoremap <leader>tl :Vista!!<CR>

let g:vista_update_on_text_changed=1
let g:vista_update_on_text_changed_delay=500

autocmd FileType vista,vista_kind nnoremap <buffer> <silent> 
			\ / :<c-u>call vista#finder#fzf#Run()<CR>

let g:vista_fzf_preview = ['right:50%']


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
" setting for tab switch
" =========================
noremap <S-t> :tabNext<CR>
noremap <S-p>t :tabprevious<CR>


" =========================
" setting for buffer switch
" =========================
noremap <S-b> :bnext<CR>
noremap <S-p>b :bprev<CR>
noremap <leader>bn :bnext<CR>
noremap <leader>bp :bprev<CR>
noremap <leader>bd :bdelete<CR>


" =========================
" setting for coc.nvim
" =========================
let g:coc_global_extensions = [ 
			\'coc-diagnostic',
			\'coc-json',
			\'coc-vimlsp',
			\'coc-sh',
			\'coc-yank',
			\'coc-git',
			\'coc-yaml',
			\'coc-python',
			\'coc-ci',
			\'coc-snippets',
			\'coc-prettier',
			\'coc-go',
			\'coc-explorer',
			\'coc-actions']
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
vmap <leader>ac  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-selected)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>aa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent> <leader>ll :<C-u>CocList<CR>
" Show all diagnostics.
nnoremap <silent><nowait> <leader>la  :<C-u>CocList diagnostics<cr>
" setting for coc-snipaste
let g:coc_snippet_next = '<tab>'
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <C-l> coc#refresh()
else
	inoremap <silent><expr> <C-l> coc#refresh()
endif

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
" setting for airline
" =========================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_filetype_overrides = {
		\ 'coc-explorer':  [ 'CoC Explorer', '' ],
		\ 'defx':  ['defx', '%{b:defx.paths[0]}'],
		\ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
		\ 'gundo': [ 'Gundo', '' ],
		\ 'help':  [ 'Help', '%f' ],
		\ 'minibufexpl': [ 'MiniBufExplorer', '' ],
		\ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
		\ 'startify': [ 'startify', '' ],
		\ 'vim-plug': [ 'Plugins', '' ],
		\ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
		\ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
		\ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
		\ }
let g:airline_mode_map = {
		\ '__'     : '-',
		\ 'c'      : 'C',
		\ 'i'      : 'I',
		\ 'ic'     : 'I',
		\ 'ix'     : 'I',
		\ 'n'      : 'N',
		\ 'multi'  : 'M',
		\ 'ni'     : 'N',
		\ 'no'     : 'N',
		\ 'R'      : 'R',
		\ 'Rv'     : 'R',
		\ 's'      : 'S',
		\ 'S'      : 'S',
		\ ''     : 'S',
		\ 't'      : 'T',
		\ 'v'      : 'V',
		\ 'V'      : 'V',
		\ ''     : 'V',
		\ }
" let g:airline_left_sep='>'
" let g:airline_right_sep="\ue0c1"
" powerline symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#left_sep = "\ue0c0"
let g:airline#extensions#tabline#left_alt_sep = "\ue0c1"
" enable coc feature
let g:airline#extensions#coc#enabled = 1
" enable gutentags feature
let g:airline#extensions#gutentags#enabled = 1
" set tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" set zoomwintab
let g:airline#extensions#zoomwintab#enabled = 1
let g:airline#extensions#zoomwintab#status_zoomed_in = 'Currently Zoomed In'
let g:airline#extensions#zoomwintab#status_zoomed_out =''
" set vista
let g:airline#extensions#vista#enabled = 1


" =========================
" setting for nerdcommenter
" =========================
let g:NERDSpaceDelims=1


" =========================
" setting for easymotion
" =========================
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings"
" Jump to anywhere with only `;{char}{target}`
map ; <Plug>(easymotion-s)


" =========================
" set theme
" =========================
set termguicolors
colorscheme dracula 
