" Debian system-wide default configuration Vim

set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" modelines have historically been a source of security/resource
" vulnerabilities -- disable by default, even when 'nocompatible' is set
set nomodeline

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Some Debian-specific things
if has("autocmd")
  " set mail filetype for reportbug's temp files
  augroup debian
    au BufRead reportbug-*		set ft=mail
  augroup END
endif

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable("/etc/papersize")
  let s:papersize = matchstr(readfile('/etc/papersize', '', 1), '\p*')
  if strlen(s:papersize)
    exe "set printoptions+=paper:" . s:papersize
  endif
endif

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif



""" Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:airline_theme='laederon' " set the theme



" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
 if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

"JUAN STUFF

set t_Co=256 " Enable color stuff
set backupdir=~/tmp,/var/tmp,/tmp
set nu "Show line numbers
set tabstop=4 "number of columns a tab counts for
set expandtab "insert spaces instead of tabs when tab key is pressed
set shiftwidth=4 "width of the indentation when using << >>
set hlsearch "highlight search results
set wildmenu "Better file explorer autocompletion
set wildmode=list:longest,full
colorscheme desert 

"Better tab switching
"map <S-h> gT
"map <S-l> gt 

" Swtich between buffers
map <S-l> :bnext<CR>
map <S-h> :bprevious<CR> 
"
"Better tab switching
map <S-k> gT
map <S-j> gt

" Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
cmap bq :bp <BAR> bd #<CR>

"Highlight chars after the 80 character mark
":au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
":au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Remove trailing whitepsace
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set .rpy files to python filetype
au BufNewFile,BufRead *.rpy sefiletype python

"" Set .tac files to python filetype
au BufNewFile,BufRead *.tac sefiletype python

" airline stuff
set laststatus=2 " Make airline show up even without splits
let g:airline#extensions#tabline#enabled = 1  " Show the tabline thingy at the top
