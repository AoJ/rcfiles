if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet proto ".st."className".et.".prototype.".st."methodName".et." = function(".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet super ".st."className".et.".prototype.".st."methodName".et." = function(".st.et.") {<CR>".st."className".et.".superclass.".st."methodName".et.".apply(this, arguments);<CR><CR>".st.et."<CR>}"
