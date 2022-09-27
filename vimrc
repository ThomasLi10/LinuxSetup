"tab 不显示全路径
function! Tabline() abort
    let l:line = ''
    let l:current = tabpagenr()

    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif

        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )

        let l:line .= '%' . i . 'T' " Starts mouse click target region.
        let l:line .= '  ' . l:label . '  '
    endfor

    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).

    return l:line
endfunction

set tabline=%!Tabline()

set number
syntax on
set autoindent
set autoread

"set cursorline                           " 高亮显示当前行
set showmatch                            " 显示匹配
set ruler                                " 显示标尺，在右下角显示光标位置


"相对行号
set relativenumber
map <F3> :set norelativenumber nonumber<CR>
map <F3><F3> :set relativenumber<CR>

"总是显示标价页
set showtabline=2
set paste
map <F2> gt<CR>
map <F1> gT<CR>

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set showmatch
set hlsearch
set incsearch
set autochdir
set wildmenu
set backspace=indent,eol,start

set encoding=utf-8
set autoindent

autocmd BufNewFile *.py exec ":call SetPyTitle()" 
autocmd BufNewFile *.sh exec ":call SetShTitle()" 

func SetPyTitle()
    call setline(1, "\# -*- coding: utf-8 -*-")
    call setline(2, "\#! /3rd/anaconda3/bin/ipython")
    call setline(3, "\"\"\"")
    call setline(4, "Author       : %AUTHOR% @ firebolt") 
    call setline(5, "Created Time : ".strftime("%Y-%m-%d %H:%M:%S")) 
    call setline(6, "Description  : <Why this script>") 
    call setline(7, "\"\"\"")
    call setline(8, "")
endfunc

func SetShTitle()
    call setline(1, "\#! /usr/bin/bash")
    call setline(2, "\# Author       : %AUTHOR% @ firebolt") 
    call setline(3, "\# Created Time : ".strftime("%Y-%m-%d %H:%M:%S")) 
    call setline(4, "\# Description  : <Why this script>") 
    call setline(5, "")
endfunc

" 自动将光标移动到文件末尾
autocmd BufNewfile * normal G

"新窗口在下方和右方打开
set splitbelow
set splitright

"切换窗口时不需要w键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""""""一键运行代码""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec "!time sh %"
    elseif &filetype == 'python'
        exec "!time ipython %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec "!pandoc % --mathjax -o index.html"
    else
        exec "!sh setup.sh"
    endif
endfunc

map <F6> :call CompileRunGcc1()<CR>
func! CompileRunGcc1()
    exec "w"
    if &filetype == 'python'
        exec "!time ipython -m ipdb %"
    endif
endfunc

