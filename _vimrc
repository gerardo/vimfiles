"" Main Vim/MacVim configuration
""
"" Gerardo Curiel <gerardo@gerardo.cc>

" remove compatibility with vi
set nocompatible

" activate pathogen module manage
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on
filetype plugin indent on

""" display
" syntax
syntax enable

set background=dark
let g:solarized_termcolors=16
let g:solarized_visibility="high"    "default value is normal
let g:solarized_contrast="high"    "default value is normal
let g:solarized_termtrans = 1
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

set nowrap

set expandtab
set textwidth=79
set tabstop=8 " tab size = 8
set softtabstop=4
set shiftwidth=4
set autoindent
set smarttab

set clipboard+=unnamed  " Yanks go on clipboard instead.
set showmatch " Show matching braces.

set showmode
set showcmd
set hidden
set cursorline
set laststatus=2
set showfulltag
set autoread
set title
set encoding=utf-8
set fileencoding=utf8
set ruler
set pastetoggle=<F2>
set splitbelow
set title

" We're not in the 70's anymore
set nobackup
set noswapfile

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

set scrolloff=3  " Keep 3 lines below and above the cursor
set report=0 "Notify me whenever any lines have changed
set confirm

set laststatus=2
set number
hi LineNr ctermfg=blue guifg=blue

""" Informational status line
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [pos=%04l,%04v][%p%%][lns=%L]\ %{fugitive#statusline()}
" Syntastic on status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Powerline
let g:Powerline_symbols = 'fancy'

" Show invisible chars
set list
set listchars=tab:▸\ ,trail:¬
set fillchars=diff:⣿

" Line wrapping on by default
set wrap
set linebreak
set formatoptions=qrn1

""" Editing
set wildchar=9
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.swp,*.class,vendor/gems/*
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.DS_Store                       " OSX

""" Folding
set foldmethod=syntax " By default, use syntax to determine folds
set foldlevelstart=99 " All folds open by default

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

"""" Keyboard shortcuts

" Use Tab to match opening/closing brackets
nnoremap <tab> %
vnoremap <tab> %

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

" Exit from Insert mode
inoremap jj <ESC>
nnoremap ; :

"" Split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>ww <C-w>s<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Save when losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

""" Ctrl+Space autocompletion. Now it's compatible
""" with console an macvim versions
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"" TagBar
nmap <F8> :TagbarToggle<CR>

"" Bind NERD_Tree plugin to a <Ctrl+E,Ctrl+E>
noremap <C-E><C-E> :NERDTree<CR>

""" Disable/enable syntax highlight
map  ,S   <Esc>:syn off<CR>
map  ,s   <Esc>:syn on<CR>

" Access to syntastic location-list.
map <Leader>e :Errors<CR>

" Clear whitespaces
autocmd BufWritePre * :%s/\s\+$//e

""" python-specific settings

autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=html.htmldjango " For SnipMate
autocmd FileType htmldjango set ft=html.htmldjango " For SnipMate

""" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python.django set omnifunc=pythoncomplete#Complete

" Highligting

" Highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

" same for javascript templates
autocmd BufRead,BufNewFile *.jst set filetype=html.htmldjango

" Vagrant
au BufRead,BufNewFile Vagrantfile set filetype=ruby

" Plugins configuration

" Coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checker_args='--ignore=W404'

" HTML indent

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Supertab
let g:SuperTabDefaultCompletionType = "context"

"" Command-Shift-F for Ack
map <D-F> :Ack<space>

" CTags
map <Leader>rt :!/usr/local/bin/ctags --extra=+f -R *<CR>
map <C-\> :tnext<CR>

"Slime
let g:slime_target = "tmux"

" VimClojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=0
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"

" Octopress
autocmd BufNewFile,BufRead *.markdown,*.textile setfiletype octopress

" TagBar
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" LaTex support

" VIM LaTeX specific configurations for Mac OS X
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'

if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
     " Linux-specific settings
     let g:Tex_ViewRule_dvi = 'evince'
     let g:Tex_ViewRule_ps = 'evince'
     let g:Tex_ViewRule_pdf = 'evince'
  else
    " OSX-specific settings
     let g:Tex_ViewRule_dvi = 'Skim'
     let g:Tex_ViewRule_ps = 'Preview'
     let g:Tex_ViewRule_pdf = 'open -a Preview'
  endif
endif

" Machine-local vim settings.
silent! source ~/.vimrc.local
