"NERDTree
if exists("loaded_nerd_tree")
	autocmd VimEnter * NERDTree
	autocmd BufEnter * NERDTreeMirror
	autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
	autocmd VimEnter * wincmd p

	" Close all open buffers on entering a window if the only
	" buffer that's left is the NERDTree buffer
	function! s:CloseIfOnlyNerdTreeLeft()
	  if exists("t:NERDTreeBufName")
	    if bufwinnr(t:NERDTreeBufName) != -1
	      if winnr("$") == 1
	        q
	      endif
	    endif
	  endif
	endfunction
endif