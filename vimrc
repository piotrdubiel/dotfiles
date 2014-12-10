set nocompatible
filetype off

function! LoadBundles()
    Plugin 'gmarik/Vundle.vim'

    Plugin 'scrooloose/nerdtree'
    Plugin 'klen/python-mode'
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'bingaman/vim-sparkup'
    Plugin 'ervandew/supertab'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'groenewege/vim-less'
    Plugin 'rstacruz/sparkup'
    Plugin 'fatih/vim-go'

    Plugin 'terryma/vim-multiple-cursors'

    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'
    Plugin 'jcf/vim-latex'
    Plugin 'rizzatti/dash.vim'
    Plugin 'suan/vim-instant-markdown'

    " Colorschemes
    Plugin 'Lokaltog/vim-distinguished'
    Plugin 'flazz/vim-colorschemes'
endfunction


" Install Vundle if needed
if executable('git')
    if !isdirectory(expand('~/.vim/bundle/Vundle.vim'))
        echo "Installing Vundle...\n"
        silent !mkdir -p ~/vim/bundle
        silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        let s:vundle_installed=1
    endif

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    call LoadBundles()
    call vundle#end()    

    if exists('s:vundle_installed') && s:vundle_installed
        unlet s:vundle_installed
        BundleInstall
        quit
    endif
endif

scriptencoding utf-8
syntax on
filetype plugin indent on
" filetype indent on
" filetype plugin on

set autoread
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set nowrap
set noswapfile
set hlsearch

"let g:solarized_termcolors=256

set background=dark
colorscheme gruvbox

if has("autocmd")
    " Auto reload .vimrc after save
    au BufWritePost,FileWritePost ~/.vimrc :source $MYVIMRC
endif

" Open .vimrc in new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Mark file as coffee script
nmap <leader>coffee :normal <S-o># vim:ft=coffee :<ESC> :write<CR> :set ft=coffee<CR>

" Python options
let g:pymode_folding = 1
let g:pymode_rope = 0
if has('autocmd')
    " autocmd BufNewFile, BufRead *.py :compiler nose
    au FileType python nmap <leader>t :RunTest<CR>
endif

" YAML options

if has('autocmd')
    au FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
endif

" Ruby options
if has('autocmd')
    autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au FileType ruby map <leader>b :normal <S-o>require 'pry'; binding.pry<ESC> :write<CR>
endif

" C/C++ options
if has('autocmd')
    autocmd BufRead,BufNewFile *.cpp,*.h,*.c,*.hpp map <D-F9> :!make<CR>
    autocmd BufRead,BufNewFile *.cpp map <D-F8> :!g++ -c %<CR>
endif

" Gradle options
if has('autocmd')
    au BufRead,BufNewFile *.gradle setlocal filetype=groovy
endif

" NERD Tree
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeBookmarksFile = expand('~/.vim/NERDTreeBookmarks')
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeIgnore=['\.o$', '\.so$', '\.bmp$', '\.class$', '^core.*',
            \ '\~$', '\.pyc$', '\.pyo$', '\.jpg$', '\.gif$',
            \ '\.png$', '\.ico$', '\.exe$', '\.cod$', '\.obj$', '\.mac$',
            \ '\.1st', '\.dll$', '\.pyd$', '\.zip$', '\.modules$',
            \ '\.bzr' ]


" Coffee Script
if has('autocmd')
     " au BufWritePost *.coffee silent execute 'CoffeeMake! -o '.expand('%:p:h').'/../js/'
     " au BufWritePost *.coffee silent CoffeeMake!
     au FileType coffee map <c-s> :CoffeeCompile watch vert<CR>
     au FileType coffee map <c-r> :CoffeeRun<CR>
     au FileType coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
endif

" Less CSS
if has('autocmd')
    au BufWritePost *.less silent :!lessc % > %:p:h/../css/%:t:r.css
endif

" JSON
if executable('python')
    map <leader>j :%! python -m json.tool<CR>
endif

function! RunTest()
    echo '...'

    if filereadable(expand('./run_test'))
        hi GreenBar term=reverse ctermfg=white ctermbg=DarkGreen guifg=white guibg=DarkGreen
        hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=red

        let msg=system("set -o pipefail && bash run_test | sed -n -e '/===========/,/---------/p'")

        let msg=substitute(msg,'[=-]','','g')
        let msg=substitute(msg, '\n', ' ', 'g')
        let msg=substitute(msg, ' ', '', '')

        redraw

        if v:shell_error == 0
            echohl GreenBar
            echon "ACK" repeat(" ", &columns - 4)
            echohl None
        else
            echohl RedBar
            echon msg repeat(" ", &columns - strlen(msg) - 1)
            echohl None
        endif
    else
        echo 'NO TEST'
    endif
endfunction

command! RunTest call RunTest()

" SnipMate
:imap <D-j> <Plug>snipMateNextOrTrigger
:smap <D-j> <Plug>snipMateNextOrTrigger

:imap <D-J> <Plug>snipMateBack
:smap <D-J> <Plug>snipMateBack

"
" ============================ MAPPINGS ======================================== 
"

