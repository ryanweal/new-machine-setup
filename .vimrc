" General things...
set swapfile
set dir=/tmp
set paste
" set nopaste to use auto-indentation

" Drupal things...
set expandtab
set tabstop=2
set shiftwidth=2
"set autoindent
"set smartindent
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php
	augroup END
endif

" Now back to general things...


"colorscheme industry " ron and slate are both OK, evening is OK too
colorscheme slate " industry was too dim for the general text

"set background=dark
"colorscheme solarized

highlight ShowTrailingWhitespace ctermbg=Red guibg=Red 

syntax on
   
