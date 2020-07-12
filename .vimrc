colorscheme peachpuff
syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
" expandtab wandelt tab in spaces um
set expandtab
set smartindent
set nu
set noswapfile
set nowrap
set smartcase
set incsearch
set background=dark
set signcolumn=no
colorscheme peachpuff

" ###### KEYBINDS#######################################################
" das <CR> hinter den commands ist dafür da, das command auszuführen
" Nerd Tree Remap zu F6
nmap <F6> :NERDTreeToggle<CR>
let mapleader = ","
map <C-t> :tabe<CR>
noremap <leader>h :sp<CR>
noremap <leader>v :vsp<CR>
tnoremap <Esc> <C-\><C-n>
inoremap <C-e> <C-o>A
inoremap <C-l> <C-o>$
" Use ESC to exit insert mode in :term
"######## PLUGS######################################################
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'preservim/nerdtree'
    " Auto pairs for '(' '[' '{'
  	 Plug 'townk/vim-autoclose'
	   Plug 'neoclide/coc.nvim', {'branch': 'release'}
     Plug 'flazz/vim-colorschemes'
     Plug 'tomasiser/vim-code-dark'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     Plug 'kien/ctrlp.vim'
     Plug 'dense-analysis/ale'
call plug#end()


"############ PLUGIN EINSTELLUNGEN########################################

" ALE Configuration
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\}
let g:ale_linters = {
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier']
\}
let g:ale_fix_on_save = 1
" ##################################################################################
" Auto install missing plugin on startup


" Automatically install missing plugins on startup
 autocmd VimEnter *
   \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
     \|   PlugInstall --sync | q
       \| endif
