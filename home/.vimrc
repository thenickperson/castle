""""""""""
" Vundle "
""""""""""

set nocompatible " disable vi compatibility
filetype off " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" New Features
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
"Bundle 'taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-unimpaired'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-endwise'
"Bundle 'tpope/vim-surround'
"Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'mileszs/ack.vim'
"Bundle 'mattn/invader-vim'
Bundle 'Lawrencium'
"Bundle 'duellj/DirDiff.vim'
"Bundle 'Shougo/neocomplcache'
"Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'

" Color Schemes
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'

" Language/Syntax Support
Bundle 'kchmck/vim-coffee-script'
Bundle 'jQuery'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'vim-ruby/vim-ruby'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on " required

""""""
" UI "
""""""

" automatically load changed files
set autoread

" show the filename in the window titlebar
set title

" set encoding
set encoding=utf-8

" directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backupf

" display incomplete commands at the bottom
set showcmd

" mouse support
set mouse=a

" line numbers
set number

" highlight cursor line
set cursorline

" wrapping stuff
set textwidth=80
set colorcolumn=80

" ignore whitespace in diff mode
set diffopt+=iwhite

" Powerline
set laststatus=2
set t_Co=256
let g:Powerline_theme='solarized256'
let g:Powerline_colorscheme='solarized256'

" remember last cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" show '>   ' at the beginning of lines that are automatically wrapped
set showbreak=>\ \ \ 

" disable folds
set nofoldenable

" enable completion
set ofu=syntaxcomplete#Complete

" make laggy connections work faster
set ttyfast

" let vim open up to 100 tabs at once
set tabpagemax=100

" case-insensitive filename completion
set wildignorecase

" briefly jump to matching braces when you insert them
set showmatch

" GitGutter
let g:gitgutter_diff_args = '-w'
" make the signs column look the same as the line number column
highlight clear SignColumn
" disable eager loading
let g:gitgutter_eager = 0

"""""""""""""
" Searching "
"""""""""""""

set hlsearch "when there is a previous search pattern, highlight all its matches
set incsearch "while typing a search command, show immediately where the so far typed pattern matches
set ignorecase "ignore case in search patterns
set smartcase "override the 'ignorecase' option if the search pattern contains uppercase characters
set gdefault "imply global for new searches

"""""""""""""
" Indenting "
"""""""""""""

" Number of spaces that a <Tab> in the file counts for
set tabstop=2
" Number of spaces to use for each step of (auto)indent
set shiftwidth=2
" Use spaces for indents
set expandtab
" When auto-indenting, use the indenting format of the previous line
set copyindent
" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of
" space at the start of the line.
set smarttab
" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command)
set autoindent
" Automatically inserts one extra level of indentation in some cases, and works
" for C-like files
set smartindent

"""""""""
" Theme "
"""""""""

syntax enable
set background=dark

if $TERM=="linux" && !has('gui_running')
  colorscheme desert
else
  colorscheme solarized
  "colorscheme molokai
  "colorscheme Tomorrow-Night-Bright
endif

""""""""
" GVim "
""""""""

if has('gui_running')
  set gfn=Tamsyn\ 10 "set font
  set gcr=n:blinkon0 "disable cursor blinking

  set guioptions-=m "remove menu bar
  set guioptions-=T "remove toolbar
  set guioptions-=L "remove left scroll bar
  set guioptions-=r "remove right scroll bar
endif

""""""""""""
" Mappings "
""""""""""""

" change leader from \ to ,
let mapleader=","

" enter vim commands without having to press shift
map ; :

" typing ;; quickly exits insert mode
imap ;; <Esc>

" git
"map <Leader>gg :GitGutterToggle<CR>
"map <Leader>gh :GitGutterLineHighlightsToggle<CR>

" bubble individual lines
nmap <Up>   [e
nmap <Down> ]e
" bubble multiple lines
vmap <Up>   [egv
vmap <Down> ]egv

" indent individual lines
nmap <Left>   <<
nmap <Right>  >>
" indent multiple lines
vmap <Left>   <gv
vmap <Right>  >gv

" delete individual lines with ctrl-k
map  <C-K>    dd
imap <C-K>    <C-O>dd

" toggle NERD Commenter
" (for some reason, these seem to also bind to C-/ in some terminals)
map  <C-_>    <Plug>NERDCommenterToggle
imap <C-_>    <C-O><Plug>NERDCommenterToggle
nmap <C-_>    <Plug>NERDCommenterToggle:normal j<CR>

" toggle NERD Tree
map <Leader>n :NERDTreeToggle<CR>

" toggle Taglist
map <Leader>l :TlistToggle<CR>

" toggle spell check
map <Leader>s :set spell!<CR>

" diffs!
map <Leader>dd :diffupdate<CR>
map <Leader>df :Fdiff<CR>
map <Leader>dg :Gdiff<CR>
map <Leader>dh :Hgvdiff<CR>

" more spell check shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" toggle invisible character display
map <Leader>h :set list!<CR>

" run/compile file (see custom commands section)
map <Leader>r :make<CR>

" swap background color (dark/light) for Solarized
call togglebg#map("<F2>")

" Format the current paragraph according to
" the current 'textwidth' with ctrl-j:
nmap <C-J>      gqap
vmap <C-J>      gq
imap <C-J>      <C-O>gqap

" tabs
map <Leader>tp :tabp<CR>
map <Leader>tn :tabnext<CR>

" opens an edit command with the path of the currently edited file filled in
" normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" opens a tab edit command with the path of the currently edited file filled in
" normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" inserts the path of the currently edited file into a command
" command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

"""""""""""""""""""""
" Language-Specific "
"""""""""""""""""""""

" configure <Leader>r shortcut (run/compile file depending on extension)
au BufNewFile,BufRead *.sh    setlocal makeprg=bash\ %
au BufNewFile,BufRead *.zsh   setlocal makeprg=zsh\ %
au BufNewFile,BufRead *.java  setlocal makeprg=javac\ %
au BufNewFile,BufRead *.rb    setlocal makeprg=ruby\ %
au BufNewFile,BufRead *.py    setlocal makeprg=python\ %
au BufNewFile,BufRead *.lisp  setlocal makeprg=clisp\ %
au BufNewFile,BufRead *.scm   setlocal makeprg=guile\ %
au BufNewFile,BufRead *.lua   setlocal makeprg=lua\ %
au BufNewFile,BufRead *.html  setlocal makeprg=google-chrome\ %

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.html.erb set ft=eruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Syntastic checkers
let g:syntastic_javascript_checkers=['jslint']
"let g:syntastic_javascript_jslint_args="--my --args --here"

" comfortable prose editing
au FileType gitcommit setlocal spell
au FileType hgcommit  setlocal spell
au FileType txt       setlocal spell
au FileType md        setlocal spell
au FileType html      setlocal spell
au FileType yaml      setlocal spell
au FileType xml       setlocal spell

"""""""""""""""""""
" Custom Commands "
"""""""""""""""""""

" remove trailing whitespace from all lines in the current buffer
command! Rtrim call <SID>RightTrim()
function! <SID>RightTrim()
  :% s/\s*$//g
  nohl
endfunction

" diff unsaved changes to file
command! Fdiff vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

" indents: convert spaces to tabs
command! -range=% -nargs=0 IndentTabs execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" indents: convert tabs to spaces
command! -range=% -nargs=0 IndentSpaces execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'

" highlight duplicated code (see http://stackoverflow.com/a/1270689/406249)
command! Dupes syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch

" troll mode
command! Troll call Troll()
function! Troll()
  map <Up>    :x<CR>
  map <Down>  :x<CR>
  map <Left>  :x<CR>
  map <Right> :x<CR>
endfunction

" noob mode
command! Noob call Noob()
function! Noob()
  unmap <Up>
  unmap <Down>
  unmap <Left>
  unmap <Right>
endfunction
