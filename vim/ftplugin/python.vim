nmap <buffer> <F5> :w<CR>:!python %<CR>
nmap <buffer> <D-Enter> :w<CR>:!python %<CR>
nmap <buffer> <F6> :w<CR>:!python %<SPACE>
nmap <buffer> <F7> :w<CR>:!pdb %<CR>
nmap <buffer> <F8> :w<CR>:!pdb %<SPACE>

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab

let b:python_highlight_all=1