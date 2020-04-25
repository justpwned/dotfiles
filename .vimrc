set belloff=all

colorscheme monokai
set term=screen-256color

syntax on

set encoding=utf-8
set belloff=all
set novb

set number
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set smarttab

set laststatus=2
set hlsearch
set ignorecase
set incsearch

"Keybindings

"<Ctrl-l> redraws the screen and removes any search highlighting
noremap <silent> <C-l> :nohl<CR><C-l>

"Go to normal mode more easily
inoremap fd <Esc>

"Python execution
inoremap <F5> <Esc>:update<CR>:!clear;python3 %<CR>
nnoremap <F5> <Esc>:update<CR>:!clear;python3 %<CR>
inoremap <F6> <Esc>:update<CR>:!python3 %<CR>
nnoremap <F6> <Esc>:update<CR>:!python3 %<CR>

inoremap {<CR> {<CR>}<Esc>O

set backspace=indent,eol,start
