let mapleader = ","

" open new split panes to right and below
set splitright
set splitbelow

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
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'mileszs/ack.vim'
call plug#end()

if (has ("termguicolors"))
        set termguicolors
endif

colorscheme material

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticalu open NERDTREE when opening vim/nvim and no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

inoremap jk <esc>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>a :Ack<space>-i<space>
nnoremap <leader>g :Git<space>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

