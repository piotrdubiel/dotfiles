set nocompatible
filetype off
scriptencoding utf-8
syntax on


" Fish is weird with vim
set shell=/bin/bash

function! LoadBundles()
    Bundle 'gmarik/vundle'

    Bundle 'scrooloose/nerdtree'
    Bundle 'tpope/vim-fugitive'
    Bundle 'klen/python-mode'
    Bundle 'vim-ruby/vim-ruby'
    Bundle 'bingaman/vim-sparkup'
    Bundle 'ervandew/supertab'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'groenewege/vim-less'
    Bundle 'ervandew/supertab'

    " for snipmate
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle 'garbas/vim-snipmate'
    Bundle 'honza/vim-snippets'

    Bundle 'terryma/vim-multiple-cursors'

    " Colorschemes
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Lokaltog/vim-distinguished'
    Bundle 'nanotech/jellybeans.vim'
    Bundle 'endel/vim-github-colorscheme'
endfunction


" Install Vundle if needed
if executable('git')
    if !isdirectory(expand('~/.vim/bundle/vundle'))
        echo "Installing Vundle...\n"
        silent !mkdir -p ~/vim/bundle
        silent !git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
        let s:vundle_installed=1
    endif

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    call LoadBundles()

    if exists('s:vundle_installed') && s:vundle_installed
        unlet s:vundle_installed
        BundleInstall
        quit
    endif
endif

filetype plugin indent on
filetype indent on
filetype plugin on

set autoread
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set nowrap
set noswapfile

let g:solarized_termcolors=256

set background=dark
colorscheme solarized

" Auto reload .vimrc after save
if has("autocmd")
    au BufWritePost,FileWritePost ~/.vimrc :source $MYVIMRC
endif

" Open .vimrc in new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Python options
let g:pymode_folding = 1
if has('autocmd')
    " autocmd BufNewFile, BufRead *.py :compiler nose
    au FileType python nmap <leader>t :RunTest<CR>
endif



" Ruby options
if has('autocmd')
    autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
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
    au BufWritePost *.coffee silent execute 'CoffeeMake! -o '.expand('%:p:h').'/../js/'
    " au BufWritePost *.coffee silent CoffeeMake!
    au FileType coffee map <c-s> :CoffeeCompile watch vert<CR>
    au FileType coffee map <c-r> :CoffeeRun<CR>
    au FileType coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au FileType coffee map <leader>t :!mocha<CR>
endif

" Less CSS
if has('autocmd')
    au BufWritePost *.less silent :!lessc % > %:p:h/../css/%:t:r.css
endif

function! RunTest()
    echo '...'

    if filereadable(expand('./test'))
        hi GreenBar term=reverse ctermfg=white ctermbg=DarkGreen guifg=white guibg=DarkGreen
        hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=red

        let msg=system("set -o pipefail && bash test | sed -n -e '/===========/,/---------/p'")

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
"
" ============================ MAPPINGS ======================================== 
"

