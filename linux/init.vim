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
set autoindent
set fileformat=unix

" set python file formatting
au BufNewFile,BufRead *.py
   \ set tabstop=4 |
   \ set softtabstop=4 |
   \ set shiftwidth=4 |
   \ set textwidth=159 " 80 characters is too small for mordern monitors.

" Vim Plug
call plug#begin('~/.vim/plugged')
    " serach plugins
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " linters
    Plug 'dense-analysis/ale'
    Plug 'puremourning/vimspector'
    " code snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " colour theme
    Plug 'lifepillar/vim-solarized8'
    " autocomplete
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/async.vim'
    Plug 'dense-analysis/ale'
    " powerline bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " general vim things
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    " c#
    Plug 'OmniSharp/omnisharp-vim'
    " python
    Plug 'vim-scripts/indentpython.vim'
    Plug 'davidhalter/jedi-vim'
    " Git integration
    Plug 'tpope/vim-fugitive'
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

" NerdTree File Explorer
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

" ALE Linter
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'

" Omnisharp C# commands
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
    autocmd FileType cs imap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)
    autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs nmap <silent> <buffer> <Leader>cf <Plug>(omnisharp_code_format)
    autocmd FileType cs nmap <silent> <buffer> <Leader>b :!dotnet build<CR>
augroup END

" git
nnoremap <buffer> <silent> <leader>gb :Git blame<CR>
nnoremap <buffer> <silent> <leader>ga :Git add<CR>

"jedi-vim python
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command="<leader>doc"
let g:jedi#usages_command="<leader>u"
let g:jedi#rename_command="<leader>rn"
