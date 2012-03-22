set background=dark
colorscheme solarized

set guioptions-=L               " Remove left scrollbar
set guioptions-=r               " Remove right scrollbar
set cursorline                  " Highlight background of current line

if has("gui_macvim")
    set transparency=5
    map <silent> <SwipeLeft> :bprev<CR>
    map <silent> <SwipeRight> :bnext<CR>

    " for vim-latex in gvim on mac
    " make sure skim is installed
    let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
    let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
    let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
    let g:Tex_ViewRule_pdf = 'Skim'
    let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
    let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'
endif
