" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FooSoft/vim-argwrap'

call vundle#end()
filetype plugin indent on
syntax on

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
set noshowmode

" Powerline terminal fixes
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=200
        au InsertLeave * set timeoutlen=200
    augroup END
endif

" Syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" Spell check toggle
:map <F7> :setlocal spell! spelllang=en_us<CR>

" Pyclewn keys
:map <F11> :Cstep<CR>
:map <F10> :Cnext<CR>

nnoremap tt :ArgWrap<CR>

" Keep JSHint's error list small 
let jshint2_height = 20

" Colors
set background=dark
colorscheme solarized

" Tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers on
set number

" Show column marker
set colorcolumn=81

" Preview window height (used for call tips)
set previewheight=6

inoremap jk <Esc>
noremap gd :YcmCompleter GoTo<CR>

" Yank text to the system clipboard
set clipboard=unnamed
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the system clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
