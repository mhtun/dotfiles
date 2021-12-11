set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set number
set relativenumber
set spell
set signcolumn=yes:1
set termguicolors
set ignorecase
set smartcase
set splitright

"-----------------------------------
" Key Maps
"-----------------------------------

let mapleader = ","

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

nmap <leader>x :!xdg-open %<cr><cr>

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/nerdtree.vim

call plug#end()
doautocmd User PlugLoaded
