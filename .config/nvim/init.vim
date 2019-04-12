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
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'lfilho/cosco.vim'
Plug 'w0rp/ale'
Plug 'simnalamburt/vim-mundo'
Plug 'kien/ctrlp.vim'

call plug#end()

" Settings specific to oni
if exists('g:gui_oni')
    set noswapfile
    set smartcase
endif

" set color scheme
colorscheme nord

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Turn on line numbers
set number

" turn on mouse
set mouse=a

" set eslint to be our ale fixer
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_fix_on_save = 1

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

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" global remaps
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" comma to toggle relative line numbers
nnoremap <silent>, :call ToggleNumber()<cr>

" normal moode leader maps
nnoremap <silent> <leader>a :ArgWrap<CR>

" comma insertion... TODO: doesn't work that well.
autocmd FileType javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)

" easy save
nnoremap <leader>s :w<cr>

" better undo tree
nnoremap <leader>u :MundoToggle<CR>

" insert mode leader maps
autocmd FileType javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

" {{ creates egyptian case block
imap {{ {<CR>}<Esc>O

" jj easy escape in insert mode
imap jj <Esc>

" easy save
inoremap <leader>s <C-c>:w<cr>

