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
let g:Powerline_symbols = 'fancy'

set background=dark
colorscheme solarized

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

set grepprg=grep\ -nH\ $*           " set grep to always display a file name

"------  Vim-Latex Options ------"

let g:tex_flavor='latex'

if &filetype != 'tex'
    imap <M-C-J> <Plug>IMAP_JumpForward
    nmap <M-C-J> <Plug>IMAP_JumpForward
    vmap <M-C-J> <Plug>IMAP_JumpForward
    vmap <M-C-J> <Plug>IMAP_DeleteAndJumpForward
endif

"------  Writeroom function ------"

let s:writeroom_active=0
function! Writeroom()
    if s:writeroom_active == 1
        let s:writeroom_active = 0
        set nowrap
        set nolinebreak
        set number
        set nospell
    else
        let s:writeroom_active = 1
        set wrap
        set linebreak
        set nonumber
        set spell
        NERDTreeClose

        try
            noremap     <unique> <silent> <Up> g<Up>
            noremap     <unique> <silent> <Down> g<Down>
            noremap     <unique> <silent> k gk
            noremap     <unique> <silent> j gj
            inoremap    <unique> <silent> <Up> <C-o>g<Up>
            inoremap    <unique> <silent> <Down> <C-o>g<Down>
        catch /E227:/
            echo "Navigational key mappings already exist."
        endtry
    endif
endfunction

nmap <silent> <Leader>V :call Writeroom()<CR>

"------  NERDTree Options  ------"

let NERDTreeIgnore=['CVS', '\.git$']
" following line finds the current file in NERDTree when pressing <Leader>a
map <leader>a :NERDTreeFind<C-M>

autocmd VimEnter * NERDTree         " Run NERDTree
autocmd VimEnter * wincmd p         " Return to main buffer

" the following autocmd will quit vim if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------  Ctrl-p  ------"
let g:ctrlp_map = '<Leader>t'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll|\.pyc|\.gem|\.DS_Store|\.swp|\.rbc$',
  \ }

"------  MiniBufExpl  ------"

let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable  = 1
let g:miniBufExplUseSingleClick = 1

"------  Buffers  ------"

set hidden                          " switch between unsaved buffers w/o needing to save

" change buffers using <Leader>{[,]}
nmap <silent> \[ :bp<CR>
nmap <silent> \] :bn<CR>

" jump to last/alternate buffer
noremap <Leader><Leader> <C-^>

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

"------  Views  ------"

" Remember cursor position and folds, but NOT options
set viewoptions=cursor,folds

" Automatically save view
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
