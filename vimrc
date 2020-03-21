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

""-------------------- Vundle --------------------
"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"call vundle#end()
"filetype plugin indent on
"
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-scripts/taglist.vim.git'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Yggdroot/indentLine'
""Plugin 'davidhalter/jedi-vim' "代码提示
""Plugin 'python-mode/python-mode'  "python模块
"call vundle#end()
"
"" 代码缩进线标志线
"let g:indentLine_char = ':'
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
""映射到ctrl+i键
"map <C-i> :IndentLinesToggle<CR>
""""""""""""""""nerdtree 文件列表"""""""""""""""""""""""
"map <F2> :NERDTreeToggle<CR>
""""""""""""""""taglist 函数列表"""""""""""""""""""""""""
"map  <F1> :TlistToggle<CR>
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"""""""""""""""""jedi-vim 代码补全"""""""""""""""""""""""
""let mapleader = ";"
""let g:jedi#goto_command = "<leader>d"
""let g:jedi#goto_assignments_command = "<leader>g"
""let g:jedi#goto_definitions_command = ""
""let g:jedi#documentation_command = "K"
""let g:jedi#usages_command = "<leader>n"
""let g:jedi#completions_command = "<C-n>"
""let g:jedi#rename_command = "<leader>r"
""
""let g:jedi#use_splits_not_buffers = "left"
""let g:jedi#popup_on_dot = 0
""let g:jedi#show_call_signatures = "2"
