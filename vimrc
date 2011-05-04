set nocompatible

colorscheme wombat256
let &t_Co=256
syntax on
set nowrap
set number
filetype on
set iskeyword+=_,$,@,%,#
set mouse=a
set showmatch
set nohlsearch
set tw=72
set fo-=c
set fo-=t
set modeline
set modelines=3

"Find stuff
set ignorecase
set smartcase
set incsearch

"In vim man pages
runtime ftplugin/man.vim

"Share clipboard
set clipboard+=unnamed
set wildmenu

"Change to directory of current file
nmap <silent> <Leader>cd :cd %:p:h<CR>

"I make the mistake of typing W and Q instead of w and q
nmap :W :w
nmap :Q :q

"Make q quit (if there are no changes)
nmap q :q<CR>

" FuzzyFinder
map <leader>f :FufFile **/<C-M>
map <leader>b :FufBuffer<C-M>

" MiniBufExplorer
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplUseSingleClick = 1

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

nmap <Leader>[ :bp<CR>
nmap <Leader>] :bn<CR>
nmap <Leader>s :vsplit<CR>

" Bind <C-B> to toggle auto-textwrap
set sr
im <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>

"Make ctrl backspace delete previous word
imap <C-BS> <C-w>

"Make shift-tab go back one tab
imap <S-Tab> <C-D>

set whichwrap=h,l,~,[,]

" Statusline
set laststatus=2
set statusline=%9*%F%m%r%h%w%{&sr?'':'[WRAP]'}%=%(%c%V\ %l/%L\ %P%)

" Bind tab to moving the cursor to the next parenthesis (or after in insert
" mode)
imap	<C-TAB>		<ESC>/)<CR>a
nmap	<C-TAB>		/)<CR>

" Default Indentation options
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set encoding=utf-8

set smartindent
set autoindent
filetype plugin indent on
    
" Automatic closing brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap /**<CR> /**<CR><CR>/<ESC>kA
	
" Views (what vim remember about a file)
" Remember cursor position and folds, but NOT options
" This caused me no end of trouble.
set viewoptions=cursor,folds

" Automatically save view
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif

augroup unmap_function_keys
  au!
  autocmd BufDelete * silent! nunmap <F4>
  autocmd BufDelete * silent! nunmap <F5>
  autocmd BufDelete * silent! nunmap <F6>
  autocmd BufDelete * silent! nunmap <F7>
  autocmd BufDelete * silent! nunmap <F8>
  autocmd BufDelete * silent! nunmap <ESC><F4>
  autocmd BufDelete * silent! nunmap <ESC><F5>
  autocmd BufDelete * silent! nunmap <ESC><F6>
  autocmd BufDelete * silent! nunmap <ESC><F7>
  autocmd BufDelete * silent! nunmap <ESC><F8>
augroup END

" Set function keys for insert mode
imap <F4> <ESC><F4>i
imap <F5> <ESC><F5>i
imap <F6> <ESC><F6>i
imap <F7> <ESC><F7>i
imap <F8> <ESC><F8>i
