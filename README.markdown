# Gerardo Curiel Vimfiles

**I'm [@gerard0]**, and this is my ~/.vim directory.

[@gerard0]: http://twitter.com/gerard0

## Installation

```bash
$ git clone git://github.com/gerardo/vimfiles.git ~/.vim
```

Create symlinks:

```bash
$ ln -s ~/.vim/_vimrc ~/.vimrc
$ ln -s ~/.vim/_gvimrc ~/.gvimrc
```

Switch to the `~/.vim` directory, and fetch submodules (mostly just [Neobundle] ):

[Neobundle]: https://github.com/Shougo/neobundle.vim

```bash
$ cd ~/.vim
$ git submodule init
$ git submodule update
```

And you're good to go!

## Updating to the latest version

To update to the latest version of the vimfiles, just run a git pull from
your `~/.vim` directory:

```bash
$ git pull origin master
```

## Pre-requisites

It requires `the_silver_searcher`, `ctags`, `git`, and `curl` .
The recommended way of installing them is using
[Homebrew](http://mxcl.github.com/homebrew/) on OSX. On Linux,
you can use your distribution's package management system.

Take a look at the [Pre-requisites wiki
page](https://github.com/gerardo/vimfiles/wiki/Pre-requisites) for more
information. If there's any missing, please open an issue.

# Intro to VIM

In case you've never used VIM before, here are some links and info worth
reading:

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).
* Watch the screencasts at [vimcasts.org](http://vimcasts.org/)
* Read wycats' perspective on learning Vim at
  [Everyone who tried to convince me to use vim was wrong](http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/)
* Read this and other answers to a question about vim at StackOverflow:
  [Your problem with Vim is that you don't grok vi](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)


## Features

The vimfiles comes with some predefined plugins and  base customizations:

* Line numbers
* Solarized as default colorscheme
* Show trailing whitespace as `¬` and tabs as `▸`
* [Airline]-enabled status line
* `<leader>w` opens a new horizontal split
* `<leader>ww` opens a new vertical split
* Remapped arrow keys to `hjkl`. Why? [Read on](http://www.catonmat.net/blog/why-vim-uses-hjkl-as-arrow-keys/)
* `<C-W>!` invokes kwbd plugin; it closes all open buffers in the open
  windows but keeps the windows open

[Airline]: https://github.com/bling/vim-airline

## [NERDCommenter](http://github.com/scrooloose/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

## [NERDTree](https://github.com/scrooloose/nerdtree)

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
:help NERDTree. Use `Ctrl+E,Ctrl+E` to toggle NERDTree

## [Ack.vim](http://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack.

## [CtrlP](https://github.com/ctrlpvim/ctrlp.vim)

Fuzzy file, buffer and mru finder.

## [Syntastic](https://github.com/scrooloose/syntastic/)

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. You will need to install the required
syntax checkers.

## [EasyMotion](https://github.com/Lokaltog/vim-easymotion)

EasyMotion provides a much simpler way to use some motions in vim. It
takes the `<number>` out of `<number>w` or `<number>f{char}` by highlighting
all possible choices and allowing you to press one key to jump directly
to the target.

When one of the available motions is triggered, all visible text
preceding or following the cursor is faded, and motion targets are
highlighted.

## [NrrwRgn](https://github.com/chrisbra/NrrwRgn)

Narrowing means focussing on a region and making the rest inaccessible.
You simply select the region, call :NarrowRegion and the selected part
will open in a new scratch buffer. The rest of the file will be
protected, so you won't accidentally modify that buffer. In the new
buffer, you can do a global replace, search or anything else to modify
that part. When you are finished, simply write that buffer (e.g. by
|:w|) and your modifications will be put in the original buffer making
it accessible again.

## [Fugitive](http://github.com/tpope/vim-fugitive)

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file


There are [more plugins included](https://github.com/gerardo/vimfiles/tree/master/_vimrc).
Check its homepages for more information.

## Feedback

Suggestions and improvements [welcome](https://github.com/gerardo/vimfiles/issues)!

## License

### This code is free to use under the terms of the MIT license.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
