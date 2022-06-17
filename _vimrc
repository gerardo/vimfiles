"" Main Vim configuration
""
"" Gerardo Curiel <gerardo@gerardo.cc>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.dotfiles/_vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.dotfiles/_vim/bundles')
  call dein#begin('~/.dotfiles/_vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.dotfiles/_vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:

  call dein#add('bling/vim-airline')
  call dein#add('edkolev/tmuxline.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('bling/vim-bufferline')
  call dein#add('tpope/vim-fugitive')

  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('mileszs/ack.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('chrisbra/NrrwRgn')
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('michaeljsmith/vim-indent-object')
  call dein#add('Raimondi/delimitMate')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ervandew/supertab')

  call dein#add('scrooloose/syntastic')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('ap/vim-css-color')
  call dein#add('tpope/vim-git')

  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

""" display
" syntax
syntax enable

set background=dark

let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"

" mapleader
let mapleader = ","

"store lots of :cmdline history
set history=500
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
set showfulltag
set autoread
set title
set encoding=utf-8
set fileencoding=utf8
set ruler
set pastetoggle=<F2>
set splitbelow
set title
set noshowmode

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

set ignorecase    " search is case insensitive
set smartcase     " search case sensitive if caps on
set incsearch     " show best match so far
set hlsearch      " Highlight matches to the search
set gdefault
set showmatch


"""" Keyboard shortcuts

" Searching and Patterns
nnoremap / /\v
vnoremap / /\v

" disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Use Tab to match opening/closing brackets
nnoremap <tab> %
vnoremap <tab> %

""" Disable/enable syntax highlight
map  ,S   <Esc>:syn off<CR>
map  ,s   <Esc>:syn on<CR>

" Stop search highlight
nnoremap <leader><space> :noh<cr>

" Save when losing focus
au FocusLost * :wa

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

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

""" Ctrl+Space autocompletion.
""" Compatible with console an macvim versions
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"" Bind NERD_Tree plugin to a <Ctrl+E,Ctrl+E>
noremap <C-E><C-E> :NERDTreeToggle<CR>

" Access to syntastic location-list.
map <Leader>e :Errors<CR>

"" Command-Shift-F for Ack/Ag
map <D-F> :Ack<space>

" CTags
map <Leader>rt :!/usr/local/bin/ctags --extra=+f -R *<CR>
map <C-\> :tnext<CR>

" Clear whitespaces
autocmd BufWritePre * :%s/\s\+$//e


""" Filetypes
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType htmldjango set ft=html

""" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile *.jst set filetype=html.htmldjango

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

au BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.markdown,*.textile setfiletype octopress


""" Plugins configuration

"Airline
let g:airline_powerline_fonts = 1

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checker_args='--ignore=W404'
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" HTML indent
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'htmldjango' : 1,
    \ 'html.htmldjango' : 1,
    \}

" Ultisnips
let g:UltiSnips = {}
let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE"] },
            \ 'html'    : {'filetypes': ["html", "htmldjango", "javascript"] },
            \ 'python'    : {'filetypes': ["python", "django"] },
            \ }

let g:UltiSnipsExpandTrigger="<C-e>j"
let g:UltiSnipsJumpForwardTrigger="<C-e>j"
let g:UltiSnipsJumpBackwardTrigger="<C-e>k"

" Machine-local vim settings.
silent! source ~/.vimrc.local
