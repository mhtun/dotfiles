" General
filetype plugin on
filetype indent on
let mapleader = ","
set autoread
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" UI
syntax on
set number
set ruler
set backspace=eol,start,indent
set lazyredraw
set relativenumber
set completeopt=menuone,noinsert,noselect
set magic
set showmatch
set foldcolumn=1
set shortmess+=c
set previewheight=10
set laststatus=2
set scrolloff=10
set signcolumn=yes

" Text/Indent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set ai
set si
set nowrap

" Vim Plug
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'puremourning/vimspector'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ayu-theme/ayu-vim'
    Plug 'lifepillar/vim-solarized8'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/async.vim'
    Plug 'dense-analysis/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" FZF
nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>

" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ayu theme
set termguicolors
" let ayucolor="dark"
set background=dark
colorscheme solarized8

" airline theme
let g:airline_theme='dark'
" let g:airline_solarized_bg='light'

" asyncomplete
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1

" Nerd Tree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'

" Omnisharp
autocmd BufWritePre *.cs :OmniSharpCodeFormat

let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths =  [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
let g:OmniSharp_fzf_options = { 'down': '10' }

augroup omnisharp_commands
    autocmd!

    autocmd CursorHold *.cs OmniSharpTypeLookup

    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
    autocmd FileType cs nmap <silent> <buffer> <Leader>doc <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_fix_usings)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
    autocmd FileType cs imap <silent> <buffer> <Leader>cn <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs nmap <silent> <buffer> <Leader>cf <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <silent> <buffer> <Leader>b :!dotnet build<CR>
augroup END
