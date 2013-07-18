set nocompatible
filetype off
scriptencoding utf-8

function! LoadBundles()
    Bundle 'gmarik/vundle'

    Bundle 'scrooloose/nerdtree'
    Bundle 'Lokaltog/powerline'
    Bundle 'tpope/vim-fugitive'
    Bundle 'klen/python-mode'
    Bundle 'vim-ruby/vim-ruby'
    Bundle 'mattn/zencoding-vim'
    Bundle 'ervandew/supertab'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'groenewege/vim-less'
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

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set nowrap
set noswapfile
colorscheme desert

if has("autocmd")
    " au BufWritePost,FileWritePost $MYVIMRC source $MYVIMRC
endif

" Open .vimrc in new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Python options
let g:pymode_folding = 1


" Ruby options
if has('autocmd')
    autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
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
            \ '\.vim$', '\~$', '\.pyc$', '\.pyo$', '\.jpg$', '\.gif$',
            \ '\.png$', '\.ico$', '\.exe$', '\.cod$', '\.obj$', '\.mac$',
            \ '\.1st', '\.dll$', '\.pyd$', '\.zip$', '\.modules$',
            \ '\.git', '\.hg', '\.svn', '\.bzr' ]


" Coffee Script
if has('autocmd')
    au BufWritePost *.coffee silent execute 'CoffeeMake! -o '.expand('%:p:h').'/../js/'
endif

" Less CSS
if has('autocmd')
    au BufWritePost *.less silent :!lessc % > %:p:h/../css/%:t:r.css
endif


"
" ============================ MAPPINGS ======================================== 
"

