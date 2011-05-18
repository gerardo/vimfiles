set guioptions=em
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll barset showtabline=2

set lines=60 columns=75
set t_Co=256
set background=dark

let g:obviousModeInsertHi = "guibg=Black guifg=White"

if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
     " Linux-specific settings
     colorscheme molokai  
     set guifont=Inconsolata\ Medium\ 10
  else
    " OSX-specific settings
     colorscheme solarized
     set guifont=Menlo\ Regular:h11
 endif
endif

