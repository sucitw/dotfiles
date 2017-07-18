" to get vundle: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible               " be iMproved
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler (inspired from github's fisadev/fisa-vim-config)
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My bundles below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" front-end plugins, coffeescript, less and jst (ejs) templates
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'briancollins/vim-jst'


Bundle 'tomtom/tcomment_vim'
Bundle 'git://github.com/scrooloose/nerdtree'
Bundle 'git://github.com/rbgrouleff/bclose.vim'

" Fork of vim-snipmate - dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

"Tim Pope is the man !
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" fuzzy finder, best plugin for file ever !
Bundle 'git://github.com/kien/ctrlp.vim' 

" a bazillion of colorscheme
Bundle 'flazz/vim-colorschemes'

" hack to get 'correct' colors on vim terminal
Bundle 'vim-scripts/CSApprox'

"fancy status line
Bundle  'Lokaltog/vim-powerline'
set t_Co=256
"let g:Powerline_symbols='unicode'
" let g:Powerline_symbols='fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"Make backspace work
set backspace=indent,eol,start

" Handlebars
Bundle 'git://github.com/juvenn/mustache.vim.git'
Bundle 'git://github.com/nono/vim-handlebars.git'

" IndentLine
Bundle 'Yggdroot/indentLine'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on     " required! (vundle)
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" personal vimrc config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

"""""""" CSApprox plugin
" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme darkocean

set gfn=Monaco:h14

"NERDtree hotkey
map <C-n> :NERDTreeToggle<CR>

"copy from system clipboard with p
"yank and allow to paste from system clipboard in other application
set clipboard=unnamed

"disable creation of .swp files
set noswapfile

"set the terminal title
set title

"Display line number on the left
set number

"in an xterm, allow the use of the mouse
set mouse=a

"showmatch: Show the matching bracket for the last ')'?
set showmatch

" treat numerals as decimal instead of octals (practical vim tip11)
set nrformats=

"causes left and right arrow to change line when reaching the end/beginning
"< and > for normal mode, [ and ] for insert mode
set whichwrap+=<,>,[,]

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saved restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,n~/.viminfo

" Get back to last position.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"set indentation to 2 spaces
set shiftwidth=2

"replace <tab> by spaces
set expandtab
set tabstop=2

"always paste with respect to indentation
nnoremap p ]p

"highlight search results
set hlsearch

"set window to fullscreen
set lines=100 columns=400

"to clear highlight search
nnoremap <F5> :let @/ = ""<CR>

"clear higlight search when opening a file
"the last search is remembered in viminfo
"and I didn't find a way to disable that
autocmd BufNewFile,BufReadPost *  let @/ = ""

" Treat long lines as break lines (useful when moving around them)
map j gj
map k gk

"folding
" set foldmethod=syntax
" set foldcolumn=1

"search is case insensitive. If the search pattern contains
"upper case letter, then it's case sensitive
set ignorecase
set smartcase

"""""""" coffeescript
"map <F6> to save and compile the file
noremap <leader>cm :w <bar> CoffeeMake<CR>
inoremap <leader>cm <esc>:w <bar> CoffeeMake<CR>

"map <F7> to save and compile the file in bare mode
nmap <F7> :w <bar> CoffeeMake -b<CR>
imap <F7> <c-o>:w <bar> CoffeeMake -b<CR>
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

"""""""" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_custom_ignore = 'node_modules\|git\|target\|bin\/src'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_map = '<leader>p'
noremap <leader>p :CtrlP .<cr>
noremap <c-p> :CtrlP .<cr>
let g:ctrlp_root_markers = ['.git, .svn']
