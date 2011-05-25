""" Gerardo Curiel <gerardo@gerardo.cc>

set nocompatible

" activate Pathogen module manage
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

""" Display
" syntax 
syntax enable

set bg=dark
set t_Co=256

" colorscheme molokai
" let g:molokai_original = 1

let g:solarized_termcolors=256 
colorscheme solarized

let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"

" mapleader
let mapleader = ","

"store lots of :cmdline history
set history=1000
set ttyfast

"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set modeline

set expandtab " expand tabs
set textwidth=79
set tabstop=8 " tab size = 8
set softtabstop=4
set shiftwidth=4 " soft space = 2
set autoindent
set smarttab
set wildchar=9 " tab as completion character
set clipboard+=unnamed  " Yanks go on clipboard instead.
set showmatch " Show matching braces.

set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set laststatus=2
set showfulltag
set autoread
set title
set encoding=utf-8 
set fileencoding=utf8
set ruler
set pastetoggle=<F2>

" We're not in the 70's anymore
set nobackup
set noswapfile

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

set scrolloff=3   " Keep 3 lines below and above the cursor
set report=0 "Notify me whenever any lines have changed
set confirm 

set laststatus=2
set cursorline
set cursorcolumn
set number
hi LineNr ctermfg=blue guifg=blue

""" Informational status line
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [pos=%04l,%04v][%p%%][lns=%L]\ %{fugitive#statusline()}

" Show invisible chars
set list
set listchars=tab:▸\ ,eol:¬

" Line wrapping on by default
set wrap
set linebreak
set formatoptions=qrn1

""" SpellChecker
"set spelllang=en,es,de,eo
"set dictionary+=/usr/share/dict/american-english

" it needs to be after pathogen
filetype on
filetype plugin on
filetype plugin indent on

""" Searching and Patterns
nnoremap / /\v
vnoremap / /\v

set ignorecase    " search is case insensitive
set smartcase     " search case sensitive if caps on 
set incsearch     " show best match so far
set hlsearch      " Highlight matches to the search 
set gdefault
set showmatch

" Stop search highlight
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

""" Editing
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp

""" Folding
set foldmethod=syntax " By default, use syntax to determine folds
set foldlevelstart=99 " All folds open by default

" Keyboard
" forcing hjkl to move 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap jj <ESC>
nnoremap ; :

"" Shift + Arrows - Visually Select text
nnoremap  <s-up>     Vk
nnoremap  <s-down>   Vj
nnoremap  <s-right>  vl
nnoremap  <s-left>   vh

" YankRing
nnoremap <silent> <F4> :YRShow<cr>
inoremap <silent> <F4> <ESC>:YRShow<cr>

"" Split windows 
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Switch between methods
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

""" Ctrl+Space autocompletion
inoremap <Nul> <C-x><C-o>

""" Toggle taglist
nmap <F3> :TlistToggle<cr>

""" Toggle highlight search
nmap <silent> <C-n> <Esc>:call ToggleHLSearch()<CR>

"" Bind NERD_Tree plugin to a <Ctrl+E,Ctrl+E>
noremap <C-E><C-E> :NERDTree<CR>
noremap <C-E><C-C> :NERDTreeClose<CR>

"" Gundo
nnoremap <F5> :GundoToggle<CR>

" Misc
""" Disable/enable syntax highlight
map  ,S   <Esc>:syn off<CR>
map  ,s   <Esc>:syn on<CR>

" disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map Ctrl-E Ctrl-W to toggle linewrap option like in VS
noremap <C-E><C-W> :set wrap!<CR>
" " Map Ctrl-M Ctrl-L to expand all folds like in VS
noremap <C-M><C-L> :%foldopen!<CR>

"" Functions
" Python customization 
function LoadPythonGoodies()

        let $PYTHONPATH .= ":/".join(split( getcwd(),'/')[0:-2],'/')."/:/".join(split( getcwd(),'/')[0:-1],'/')."/"
        exec "set path+='/".join(split( getcwd(),'/')[0:-2],'/')."/,/".join(split( getcwd(),'/')[0:-1],'/')."/'"
        python import os,sys,vim
        exec "python sys.path.insert(0,'/".join(split( getcwd(),'/')[0:-2],'/')."')"
        exec "python sys.path.insert(0,'/".join(split( getcwd(),'/')[0:-1],'/')."')"

        " set python path to vim's search path
        python << EOF
import os, sys, vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
            " some nice adjustaments to show errors
            let python_highlight_builtins = 1
            let python_highlight_exceptions = 1
            let python_highlight_string_formatting = 1
            let python_highlight_string_format = 1
            let python_highlight_string_templates = 1
            let python_highlight_indent_errors = 1
            let python_highlight_space_errors = 1
            let python_highlight_doctests = 1
endfunction


""" python-specific settings

au BufNewFile,BufRead *.py call LoadPythonGoodies()
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

autocmd FileType python,perl,java,c,ant,sh,conf,cpp,css,haskell,htmldjango,html,javascript,lisp,vim,xml,yaml Tlist


" Plugins configuration

let g:pydiction_location='~/.vim/tags/complete-dict'

" Load snipMate support functions
source ~/.vim/snippets/support_functions.vim

" Yankring 
let g:yankring_history_dir = '~/.vim/'

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Supertab

let g:SuperTabDefaultCompletionType = "context"

""" Abbr
iabbr _me Gerardo Curiel <gerardo@gerardo.cc><CR>
