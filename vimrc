" 1 - NeoBundle core

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

let g:vim_bootstrap_langs = "javascript,python,c,php,html"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

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
NeoBundle "morhetz/gruvbox"
NeoBundle 'scrooloose/nerdtree'
NeoBundle "itchyny/lightline.vim"
NeoBundle "godlygeek/csapprox.git"
NeoBundle "skwp/vim-colors-solarized"
NeoBundle "chrisbra/color_highlight.git"

" 2.2 - Git
NeoBundle "tpope/vim-git"
NeoBundle "mattn/gist-vim"
NeoBundle "gregsexton/gitv"
NeoBundle "tpope/vim-fugitive"
NeoBundle 'airblade/vim-gitgutter'

" Required:
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 3 - Settings
" 3.1 - NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" 3.2 - Git
" 3.2.1 - Fugitive
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

" 4 - Keybinding
" 4.1 - NERDTree
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>
