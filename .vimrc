colorscheme wombat256
syntax on
set nowrap
set number
filetype on
set iskeyword+=_,$,@,%,#
set mouse=a
set showmatch
set nohlsearch
set tw=72

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
setl sr
im <C-B> <C-O>:setl sr! fo<C-R>=strpart("-+",&sr,1)<CR>=tc<CR>

" Omnicompletion
" Map it to <Ctrl> + Space:
inoremap <C-Space> <C-x><C-o>


"Make ctrl backspace delete previous word
	imap <C-BS> <C-w>

"Make shift-tab go back one tab
	imap <S-Tab> <C-D>

set whichwrap=h,l,~,[,]

"Statusline
set laststatus=2
set statusline=%9*%F%m%r%h%w%{!&sr?'[WRAP]':''}%=%(%c%V\ %l/%L\ %P%)

"Bind tab to moving the cursor to the next parenthesis (or after in insert
"mode)
	imap	<C-TAB>		<ESC>/)<CR>a
	nmap	<C-TAB>		/)<CR>

" Programming
"

	" Indentation options
		set shiftwidth=2
		set tabstop=2
		set softtabstop=2
		set expandtab

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

    " Shell
        nnoremap <silent> <F2> :shell<CR>

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

    " Language-specific
    " -----------------

	au BufRead,BufNewFile Makefile* set noexpandtab

    " C
    augroup lang_c
        au!

		au BufRead *.c,*.h set shiftwidth=4
		au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
		au BufRead,BufNewFile *.c,*.h set noexpandtab
		
		au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
		
		autocmd FileType c nmap <F5> :w<CR>:!gcc -Wall -g % -o %:r && ./%:r<CR>
        autocmd FileType c nmap <F6> :w<CR>:!gcc -Wall -g % -o %:r && ./%:r<SPACE>
        autocmd FileType c nmap <F7> :w<CR>:!gcc -Wall -g % -o %:r && gdb %:r<CR>
        autocmd FileType c nmap <F8> :w<CR>:!gcc -Wall -g % -o %:r && gdb %:r<SPACE>
    augroup END

  " C++
  augroup lang_cpp
    au!

		au BufRead *.cpp,*.hpp set shiftwidth=4
		au BufRead,BufNewFile *.cpp,*.hpp set tabstop=4
		au BufRead,BufNewFile *.cpp,*.hpp set noexpandtab
		
		au BufRead,BufNewFile *.cpp,*.hpp set formatoptions-=c formatoptions-=o formatoptions-=r
		
		autocmd FileType cpp nmap <F5> :w<CR>:make<CR>
    autocmd FileType cpp nmap <F6> :w<CR>:!g++ -Wall -g % -o %:r && ./%:r<SPACE>
    autocmd FileType cpp nmap <F7> :w<CR>:!g++ -Wall -g % -o %:r && gdb %:r<CR>
    autocmd FileType cpp nmap <F8> :w<CR>:!g++ -Wall -g % -o %:r && gdb %:r<SPACE>
  augroup END

	" Python
	augroup lang_python
		au!
    autocmd FileType python nmap <F5> :w<CR>:!python %<CR>
		autocmd FileType python nmap <F6> :w<CR>:!python %<SPACE>
		autocmd FileType python nmap <F7> :w<CR>:!pdb %<CR>
		autocmd FileType python nmap <F8> :w<CR>:!pdb %<SPACE>

		au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
		au BufRead,BufNewFile *py,*pyw set tabstop=4
		au BufRead,BufNewFile *.py,*.pyw set expandtab

		set encoding=utf-8
		let python_highlight_all=1

	augroup END 

	" SQL
	augroup lang_sql
		au!

		au BufRead,BufNewFile *.sql set shiftwidth=4
		au BufRead,BufNewFile *.sql set tabstop=4
		au BufRead,BufNewFile *.sql set expandtab

		set encoding=utf-8

	augroup END

  " MD, TXT
  augroup lang_text
    au!

    au BufRead,BufNewFile *.{txt,md} set tw=72
    au BufRead,BufNewFile *.{txt,md} set fo=cqt
  augroup END
