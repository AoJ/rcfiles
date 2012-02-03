set nocompatible                    " Prevents VIM from being nerfed into acting like VI
call pathogen#infect()              " Loads Pathogen
set history=1000                    " 1000 item history
set undolevels=1000                 " 1000 item undo buffer
let mapleader=","                   " set leader to ,
set title                           " update the terminals title

"------  Visual Options  ------"

syntax enable                       " enable syntax highlighting
set number                          " enable line numbers
set nowrap                          " disable word wrap
set vb                              " visual bell
set showmatch                       " show matching bracket

set laststatus=2                    " always use a status line
set statusline=%9*%F%m%r%h%w%{&sr?'':'[WRAP]'}%=%(%c%V\ %l/%L\ %P%)

set background=dark
colorscheme solarized

let &t_Co=256                       " help ensure vim supports 256 colors

"------  Behavior  ------"

set tabstop=4                       " tab = 4 spaces
set shiftwidth=4                    " indent to 4 spaces
set softtabstop=4                   " Number of spaces that a <Tab> counts for
set expandtab                       " use spaces instead of tabs
set autoindent                      " auto indent
set smartindent                     " use vim smart indenting

" Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

set iskeyword+=_,$,@,%,#

set mouse=a                         " Use mouse always

filetype on                         " enable filetype plugin loading
filetype indent on
filetype plugin on

set encoding=utf-8

"------  Searching  ------"

set incsearch                       " Search while typing
set ignorecase                      " Case insensitive searching
set smartcase                       " lowercase = case insensitive, any uppercase = case sensitive
set hlsearch                        " highlight all search results

" following line clears the search highlights when pressing <Leader>s
nnoremap <Leader>s :nohlsearch<CR>

"------  NERDTree Options  ------"

let NERDTreeIgnore=['CVS', '\.git$']
" following line finds the current file in NERDTree when pressing <Leader>a
map <leader>a :NERDTreeFind<C-M>

autocmd VimEnter * NERDTree         " Run NERDTree
autocmd VimEnter * wincmd p         " Return to main buffer

" the following autocmd will quit vim if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------  MiniBufExpl  ------"

let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplUseSingleClick = 1

"------  Buffers  ------"

set hidden                          " switch between unsaved buffers w/o needing to save

" change buffers using <Leader>{[,]}
nmap <silent> <Leader>[ :bp<CR>
nmap <silent> <Leader>] :bn<CR>

"------  Moving Between Windows  ------"

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

"------  Text Width Stuff  ------"

set tw=72
set fo-=c
set fo-=t
set modeline
set modelines=3
set sr
set whichwrap=h,l,~,[,]

"------  Vim Config Stuff  ------"

"Set swp files to go to a central location
set backupdir=$HOME/.vim/swp//,/tmp
set directory=$HOME/.vim/swp//,/tmp

"Share clipboard
set clipboard+=unnamed
set wildmenu

"------  Helpful keybindings  ------"

" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>

"Make shift-tab go back one tab
imap <S-Tab> <C-D>
    
" Automatic closing brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap /**<CR> /**<CR><CR>/<ESC>kA

"I make the mistake of typing W and Q instead of w and q
nmap :W :w
nmap :Q :q

nmap q  :q<CR>

"------  Views  ------"

" Remember cursor position and folds, but NOT options
set viewoptions=cursor,folds

" Automatically save view
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
