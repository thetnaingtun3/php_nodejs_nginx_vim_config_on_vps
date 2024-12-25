syntax on
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a


" Function to use sudo when saving a file
command! W execute 'w !sudo tee % > /dev/null' | edit!

colorscheme desert
" Map 'jk' to switch to normal mode from insert mode
inoremap jk <Esc>
" Map 'i' to switch to insert mode
nnoremap i i
