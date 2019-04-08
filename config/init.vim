
" Auto install vim-plug and plugins 
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Vim plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()


if exists('g:gui_oni')
    " Statements here
    " init.vim

    set number
    set noswapfile
    set smartcase
endif

set mouse=a

" dont show mode line since we are using lightline
set noshowmode

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
let g:argwrap_tail_comma = 1
let g:argwrap_padded_braces = '[{'

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }


" global remaps
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" normal moode leader maps
nnoremap <silent> <leader>a :ArgWrap<CR>
autocmd FileType javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
nnoremap <leader>s :w<cr>

" insert mode leader maps
autocmd FileType javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
imap <leader>{ {<CR>}<Esc>O
imap {{ <leader>{
imap <leader>[ <leader>{
imap jj <Esc>
inoremap <leader>s <C-c>:w<cr>

