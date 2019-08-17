" On first run, make sure you run :PlugInstall and then install the following
" coc plugins (:CocInstall <plugin>)
" coc-tsserver
" coc-json
" coc-snippets
" coc-yaml

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

" perhaps time to remove
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" and replace with
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'kristijanhusak/vim-dirvish-git'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'

Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-abolish'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test' " run test from vim
Plug 'neomake/neomake' " runs make asynchronously in background
 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'neovim/node-host'
Plug 'jkassis/vim-chrome-devtools', { 'do': 'npm install && npm run build' }
" you will need to do :UpdateRemotePlugins after installing

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'janko/vim-test'
" run stuff in a tmux pane
Plug 'christoomey/vim-tmux-runner'
" Per project settings
Plug 'tpope/vim-projectionist'

call plug#end()

if exists('g:gui_oni')
	" Settings specific to oni
	set noswapfile
	set smartcase
else
  " settings specific to not oni
endif

" Vim Test
autocmd BufRead,BufNewFile ~/src/aero-frontend-stack/app/workspace/**/*.js let g:test#javascript#jest#options = '-c ./resources/jest-config-unit-tests.json'
let g:test#strategy = 'vtr'

" markdown settings
augroup markdownSpell
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" launage server
let g:vista_default_executive = 'coc'

let g:grepper = {}
let g:grepper.tools = ["rg", "notests"]
let g:grepper.notests = { 'grepprg': 'rg -H --no-heading --vimgrep --type-not tests' . (has('win32') ? ' $* .' : ''),
  \ 'grepformat': '%f:%l:%c:%m',
  \ 'escape':     '\^$.*+?()[]{}|' }
runtime autoload/grepper.vim
nnoremap <leader>g :GrepperRg<Space>
nnoremap gr :Grepper -cword -noprompt<CR>
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

augroup vimrcQfClose
  autocmd!
  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

" Set syntax to markdown when creating notes with taskopen
autocmd BufRead,BufNewFile ~/tasknotes/*.txt set syntax=markdown

" nerdTree
" let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Obey gitignore
let g:NERDTreeShowIgnoredStatus = 1
" Gitignore doesn't seem to actually work properly in nerdtree at this
" point.  this cuts out a lot of what I don't want.
" let NERDTreeIgnore=['node_modules/*', 'coverage/*', 'build/*']
let NERDTreeIgnore=['node_modules/*', 'coverage/*']

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

" So vim-json doesn't hide quotation marks (how is this not default?)
set conceallevel=0

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
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --ignore "node_modules" --nocolor -g ""'
endif

" configure completion
let g:deoplete#enable_at_startup = 1

" use tabs
imap <expr><TAB>
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" :
      \ 	  pumvisible() ? "\<C-n>" : "\<TAB>"

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

" jump

nnoremap <leader>. :Vista finder<cr>
nmap <silent>tt :Vista!!<CR>
nmap <silent>TT :NERDTreeToggle<CR>

" open dirvish
nnoremap <leader>f :Dirvish<CR>

""""""""""""""""""""""""""""""""""""""""""""
"  Taken from example vim on coc.vim readme.
""""""""""""""""""""""""""""""""""""""""""""

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

autocmd FileType dirvish nmap <silent><buffer><C-n> <Plug>(dirvish_git_next_file)
autocmd FileType dirvish nmap <silent><buffer><C-p> <Plug>(dirvish_git_prev_file)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

source ~/.config/nvim/abbrev.vim
