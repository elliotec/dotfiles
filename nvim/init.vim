" This file should be at ~/.config/nvim/init.vim
call plug#begin('~/.nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'carlitux/deoplete-ternjs'
Plug 'gioele/vim-autoswap'
Plug 'vim-scripts/YankRing.vim'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'jaawerth/nrun.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leshill/vim-json'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-litecorrect'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'amix/vim-zenroom2'
Plug 'onur/vim-motivate'
Plug 'mhinz/vim-startify'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

colorscheme molokai
"for proper scrolling/mouse behavior
set mouse=a
"don't find these filetypes
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
"don't find these filetypes either
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
"be able to copy from neovim to clipboard on mac and ubuntu
set clipboard=unnamedplus
set number
set smartcase
set ignorecase
set noshowmode
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
set autoindent
set listchars=tab:--,trail:·
set list
set scrolloff=8
set complete+=kspell
set dictionary="/usr/dict/words"
set directory=~/.config/nvim/tmp//
set backupdir=~/.config/nvim/tmp/backup//
set undofile
set history=500
set undodir=~/.config/nvim/tmp/undo//
set undolevels=500
set undoreload=5000
set colorcolumn=80
set foldmethod=indent
set foldcolumn=1
set foldlevelstart=20
hi foldcolumn ctermbg=232
hi folded ctermbg=232
hi foldcolumn ctermfg=242
hi folded ctermfg=242

"space is leader key
let mapleader = "\<Space>"
"faster normal mode from insert mode
inoremap jj <ESC>
"faster saving
nnoremap <leader>w :w<CR>
"jsx commenting
nnoremap <leader>jc i{/*<space>*/}<esc>hhi
"open NERDTree
map <C-o> :NERDTreeToggle %:p:h<CR>
"open Gundo
nnoremap <leader>u :GundoToggle<CR>
"tab with visual mode
vmap <Tab> >gv
"back tab with visual mode
vmap <S-Tab> <gv
"edit this file in a new window
nnoremap <leader>ev :vsp $MYVIMRC<CR>
"fuzzy find file in project with FZF
nnoremap F :FZF<CR>
"search project for word under cursor with Ag
nnoremap <silent> <leader>f :Ag <C-R><C-W><CR>
"start Ag search
nnoremap <leader>ag :Ag<space>
"git status
nnoremap <leader>gs :Gstatus<CR>
"git commit
nnoremap <leader>gcm :Gcommit -m<space>
"shift-y copies line
noremap Y y$
"moves line down in normal mode
nnoremap <C-j> :m .+1<CR>==
"moves line up in normal mode
nnoremap <C-k> :m .-2<CR>==
"moves cursor down line in insert mode "
inoremap <C-j> <Esc>:m .+1<CR>==gi
"moves cursor up line in insert mode "
inoremap <C-k> <Esc>:m .-2<CR>==gi
"moves selected block down line visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
"moves selected block up line visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
"distraction-free mode
nnoremap <silent> <leader>z :Goyo<CR>

autocmd User Startified setlocal cursorline
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
let g:NERDSpaceDelims = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ],
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
let NERDTreeShowHidden = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:jsx_ext_required = 0
au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_css_enabled_makers = ['stylelint']
let g:neomake_open_list = 1
let g:neomake_list_height = 3
let g:yankring_history_dir = '~/.config/nvim/tmp/yank'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
let g:startify_change_to_dir = 0
let g:startify_custom_header =
        \ map(split(system('fortune -s | cowsay | lolcat'), '\n'), '"   ". v:val') + ['']
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
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

ino " ""<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
