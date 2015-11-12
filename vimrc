" 1 - NeoBundle core

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 2 - Packages
" 2.1 - Apparence
NeoBundle 'morhetz/gruvbox'
NeoBundle 'itchyny/lightline.vim'
" Just for term with 256 colors support
NeoBundle 'godlygeek/csapprox.git'
NeoBundle 'tomasr/molokai'
NeoBundle 'skwp/vim-colors-solarized'
NeoBundle 'chrisbra/color_highlight.git'

" 2.2 - Git
NeoBundle 'tpope/vim-git'
NeoBundle 'mattn/gist-vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" 2.3 - Languages
" 2.3.1 - General
NeoBundle 'sheerun/vim-polyglot'

" 2.3.2 - Python
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'davidhalter/jedi-vim'

" 2.3.3 - C
NeoBundle 'vim-scripts/c.vim'

" 2.3.4 - Javascript
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/javascript-libraries-syntax.vim'

" 2.3.5 - HTML
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'gorodinskiy/vim-coloresque'

" 2.3.6 - PHP
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'arnaud-lb/vim-php-namespace'

" 2.3.7 - Markdown
NeoBundle 'plasticboy/vim-markdown'

" 2.4 - Utilities
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bronson/vim-trailing-whitespace'

" 2.5 - Snippets
NeoBundle 'honza/vim-snippets'

" 2.6 - Project
NeoBundle 'sjl/gundo.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'xolox/vim-session'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs.git'
NeoBundle 'MattesGroeger/vim-bookmarks'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 3 - General settings
" 3.1 - Miscellaneous
" Map leader
let mapleader=','

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab


" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set keymap=accents

" Fix backspace indent
set backspace=indent,eol,start

" Enable hidden buffers
set hidden

" Encoding
set bomb
set binary

" Directories for swp files
set nobackup
set noswapfile

" 3.2 - NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeShowBookmarks=1

" 3.3 - NERDTree Tabs
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0

" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" 3.4 - Session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" 3.5 - neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_smart_case = 1

" Default # of completions is 100, that's crazy.
let g:neocomplete#max_list = 5

" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 3

" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out.
let g:neocomplete#force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete"

" 3.6 - Gundo
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60

" 3.7 - Syntastic
let g:syntastic_javascript_checkers = ['jshint']

" 4 - oisual settings
" 4.1 - General
syntax on
set ruler
set number
set t_Co=256
set background=dark
colorscheme molokai

"4.2 - Lightline
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste'  ],
	\             [ 'fugitive', 'readonly', 'filename', 'modified'  ]  ]
	\ },
	\ 'component_function': {
	\   'fugitive': 'MyFugitive',
	\   'readonly': 'MyReadonly',
	\   'filename': 'MyFilename',
	\ },
	\ }

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤ "
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction

" Use status bar even with single buffer
set laststatus=2

" 5 - Keybinding
" 5.1 - NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" 5.2 - Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" 5.3 - Git
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>
noremap <silent> ,dg :diffget<CR>
noremap <silent> ,dp :diffput<CR>

" 5.4 Session management
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>"

" 5.5 - CtrlP
let g:ctrlp_map = '<leader>e'

" 5.6 - Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" 5.7 - Close buffer
noremap <leader>c :bd<CR>

" 5.8 - Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" 5.9 - Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" 5.10 - neocomplete - map standard Ctrl-N completion to Ctrl-Space
inoremap <C-Space> <C-n>

" 5.11 - Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" 5.12 - Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1"

" 5.13 - Gundo
nnoremap <F5> :GundoToggle<CR>

" 5.14 - Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv"

" 6 - Manual
" NeoBundle 'AndrewRadev/splitjoin.vim'
" NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle'MattesGroeger/vim-bookmarks'
