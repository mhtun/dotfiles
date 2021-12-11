Plug 'puremourning/vimspector'

nmap <leader>db :call vimspector#Launch()<CR>
nmap <leader>dp :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>do :call vimspector#StepOver()<CR>
nmap <leader>di :call vimspector#StepInto()<CR>
nmap <leader>dc :call vimspector#Continue()<CR>
nmap <leader>ds :call vimspector#Stop()<CR>
