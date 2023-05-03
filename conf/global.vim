set number
set relativenumber
set scrolloff=6
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autoindent
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set pumheight=10
filetype plugin indent on
syntax on
syntax enable
let mapleader = " "
map <space> <nop>
" use jj to escape insert mode.
let g:better_escape_shortcut = 'jk'
" set time interval to 200 ms
let g:better_escape_interval = 150
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

nmap <Leader>w :w<cr>
" nmap <C-q> :q<cr>
