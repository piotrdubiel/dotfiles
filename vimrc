set nocompatible
filetype off
scriptencoding utf-8

function! LoadBundles()
    Bundle 'gmarik/vundle'

    " Press F2 to see a list of files and directories from your
    " current working directory
    Bundle 'scrooloose/nerdtree'

    " Powerline
    Bundle 'Lokaltog/powerline'

    " Git plugins
    Bundle 'tpope/vim-fugitive'

    " Python plugins
    Bundle 'klen/python-mode'

    " Ruby plugins
    Bundle 'vim-ruby/vim-ruby'

    " HTML plugins
    Bundle 'mattn/zencoding-vim'

    " Supertab
    Bundle 'ervandew/supertab'
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
    autocmd bufwritepost .vimrc source $MYVIMRC; 
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


"
" ============================ MAPPINGS ======================================== 
"

" Calculator mapping
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
