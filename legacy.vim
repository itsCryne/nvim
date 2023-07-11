set number
set ruler
set wrap
set mouse=

syntax enable
filetype plugin indent on

" easy buffer resize
:nmap <Esc>l :vertical res +1<Enter>
:nmap <Esc>h :vertical res -1<Enter>
:nmap <Esc>k :res +1<Enter>
:nmap <Esc>j :res -1<Enter>

" switch between hpp and cpp
au BufEnter,BufNew *.cpp nnoremap <silent> ;p :e %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;p :e %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent> ;vp :leftabove vs %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;vp :rightbelow vs %<.cpp<CR>

au BufEnter,BufNew *.cpp nnoremap <silent> ;xp :leftabove split %<.hpp<CR>
au BufEnter,BufNew *.hpp nnoremap <silent> ;xp :rightbelow split %<.cpp<CR>

" switch between h and c
au BufEnter,BufNew *.c nnoremap <silent> ;p :e %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;p :e %<.c<CR>

au BufEnter,BufNew *.c nnoremap <silent> ;vp :leftabove vs %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;vp :rightbelow vs %<.c<CR>

au BufEnter,BufNew *.c nnoremap <silent> ;xp :leftabove split %<.h<CR>
au BufEnter,BufNew *.h nnoremap <silent> ;xp :rightbelow split %<.c<CR>

" open same file in vertical/horizonal splits
nnoremap <silent> ;vmp :leftabove vsplit %<CR>
nnoremap <silent> ;xmp :leftabove split %<CR>

" faster updates!
set updatetime=100

" no hidden buffers
set nohidden

" history
set undodir=~/.cache/nvim/undodir
set undofile

" automatically read on change
set autoread

" nabla
nnoremap <leader>p :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
