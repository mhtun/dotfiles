set autoindent
set autoread
set expandtab
set shiftwidth=4
set relativenumber
set number
set laststatus=2
set splitbelow

let mapleader = ","

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-repeat',
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'mklabs/split-term.vim'
Plug 'kburdett/vim-nuuid'

call plug#end()

" color settings
set termguicolors
set background=dark
colorscheme solarized

"deoplete
let g:deoplete#enable_at_startup=1

"airline config
let g:airline_theme='kalisi'
let g:airline_powerline_fonts=1

" jedi config
let g:jedi#use_splits_not_buffers="left"
let g:jedi#show_call_signatures=1
let g:jedi#force_py_version=3
" disable completions. we're using deoplete
let g:jedi#completions_enabled=0

" remap window move keys.
nnoremap <C-h> <C-w><C-h><CR>
nnoremap <C-l> <C-w><C-l><CR>
nnoremap <C-j> <C-w><C-j><CR>
nnoremap <C-k> <C-w><C-k><CR>
nnoremap <leader>f :Vex<CR>

" vim merge commands.
nnoremap <leader>ur :diffg RE<CR>
nnoremap <leader>ul :diffg LO<CR>
nnoremap <leader>ub :diffg BA<CR>

"fugutive mappings
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gread<CR>

"terminal
nnoremap <leader>t :Term<CR>
nnoremap <leader>vt :VTerm<CR>

cmap w!! w !sudo tee > /dev/null %

" makefile
autocmd FileType make setlocal ts=2 noexpandtab
