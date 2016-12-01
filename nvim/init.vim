call plug#begin('~/.nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'carlitux/deoplete-ternjs'
Plug 'gioele/vim-autoswap'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'onur/vim-motivate'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-litecorrect'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'amix/vim-zenroom2'
call plug#end()

colorscheme molokai
set foldmethod=syntax
set foldlevelstart=20
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
set clipboard=unnamedplus
set number
set smartcase
set ignorecase
set noshowmode
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set autoindent
set listchars=tab:--,trail:·
set list
set shortmess=atI
set scrolloff=8
set complete+=kspell
set dictionary="/usr/dict/words"
set directory=~/.vim/tmp//
set backupdir=~/.vim/tmp//
set undofile
set history=500
set undodir=~/.vim/tmp/undo/
set undolevels=500
set undoreload=5000
set cscopetag

let mapleader = "\<Space>"
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap <leader>w :w<CR>
map <C-o> :NERDTreeToggle %:p:h<CR>
nnoremap <C-u> :GundoToggle<CR>
vmap <Tab> >gv
vmap <S-Tab> <gv
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap F :FZF<CR>
nnoremap <silent> <leader>f :Ag <C-R><C-W><CR>
noremap Y y$
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <silent> <leader>z :Goyo<CR>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
autocmd bufread,bufnewfile *.md,*.markdown setlocal spell
autocmd bufread,bufnewfile *.md,*.markdown setlocal wrap
autocmd bufread,bufnewfile *.md,*.markdown call litecorrect#init()
autocmd bufread,bufnewfile *.md,*.markdown call pencil#init({'wrap': 'soft'})
autocmd! BufWritePost * Neomake
let g:deoplete#enable_at_startup = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \  'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
let g:user_emmet_expandabbr_key = '<c-y>'
let g:tmuxline_powerline_separators = 0
let g:vim_markdown_frontmatter = 1
let g:tern_request_timeout = 1
let g:indentLine_char = '┆'
let NERDTreeShowHidden=1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:jsx_ext_required = 0
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 1
let g:neomake_list_height = 5
runtime macros/matchit.vim
function! s:goyo_enter()
  silent !tmux set status off
  Goyo 100x90%
  Limelight
endfun
function! s:goyo_leave()
  silent !tmux set status on
  Limelight!
endfun
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

