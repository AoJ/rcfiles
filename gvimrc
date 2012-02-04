set background=dark
colorscheme solarized

set guioptions-=L               " Remove left scrollbar
set guioptions-=r               " Remove right scrollbar
set cursorline                  " Highlight background of current line

if has("gui_macvim")
    set transparency=5
    map <silent> <SwipeLeft> :bprev<CR>
    map <silent> <SwipeRight> :bnext<CR>
endif
