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

"Enable mouse wheel scrolling/selection
set mouse=a
set clipboard=unnamedplus

"Keybindings

"Switch between buffers with Tab and Shift Tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"Easier split screen navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"<Ctrl-l> redraws the screen and removes any search highlighting
noremap <silent> <C-l> :nohl<CR><C-l>

inoremap {<CR> {<CR>}<Esc>O

set backspace=indent,eol,start
