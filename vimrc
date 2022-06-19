set number
syntax on
set autoindent
set autoread
set wrap

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

autocmd BufNewFile *.py exec ":call SetPyTitle()" 
autocmd BufNewFile *.sh exec ":call SetShTitle()" 

func SetPyTitle()
    call setline(1, "\# -*- coding: utf-8 -*-")
    call setline(2, "\"\"\"")
    call setline(3, "\# Author: %AUTHOR%") 
    call setline(4, "\# Created Time : ".strftime("%c")) 
    call setline(5, "\# File Name: ".expand("%")) 
    call setline(6, "\# Description:") 
    call setline(7, "\"\"\"")
    call setline(8, "")
endfunc

func SetShTitle()
    call setline(1, "\#! /bin/bash")
    call setline(2, "\# Author: %AUTHOR%") 
    call setline(3, "\# Created Time : ".strftime("%c")) 
    call setline(4, "\# File Name: ".expand("%")) 
    call setline(5, "\# Description:") 
    call setline(6, "")
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
        :!time bash %
    elseif &filetype == 'python'
        exec "!time ipython %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

map <F6> :call CompileRunGccDebug()<CR>
func! CompileRunGccDebug()
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
        :!time bash %
    elseif &filetype == 'python'
        exec "!time ipython -m pdb %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

