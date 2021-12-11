Plug 'EdenEast/nightfox.nvim'

augroup NightfoxOverrides
    autocmd!
    autocmd ColorScheme nordfox highlight NightfoxBoundary guibg=none
    autocmd ColorScheme nordfox highlight NightfoxDiffDelete ctermbg=none guibg=none
    autocmd ColorScheme nordfox highlight NightfoxComment cterm=italic gui=italic
    autocmd User PlugLoaded ++nested colorscheme nordfox
augroup end
