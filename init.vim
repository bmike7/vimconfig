let mapleader = ","

set number
set showcmd
set showmatch
set wildmenu
set relativenumber
syntax on
set tabstop=2
set autoindent
set expandtab
set softtabstop=2

set incsearch
set hlsearch

call plug#begin("~/.vim/plugged")
        Plug 'kaicataldo/material.vim'
        Plug 'preservim/nerdtree'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tpope/vim-fugitive'
call plug#end()

if (has ("termguicolors"))
        set termguicolors
endif

colorscheme material

inoremap jk <esc>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>a :Ack<space>-i<space>
nnoremap <leader>g :Git<space>
