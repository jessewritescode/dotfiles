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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

call plug#end()

if exists('g:gui_oni')
	" Settings specific to oni
	set noswapfile
	set smartcase
else
  " settings specific to not oni
	" start nerd-tree if no files were specified on startup
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

" nerdTree
nmap <silent>tt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" make sure nerd tree is left hanging if every other buffer is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" configure lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" configure emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" configure completion
let g:deoplete#enable_at_startup = 1

" snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1

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

