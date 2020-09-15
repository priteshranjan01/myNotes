source $VIMRUNTIME/defaults.vim

" https://w.amazon.com/bin/view/Users/Derebolt/vim-code-browser/ Generate
" code.amazon.com url from inside VIM. Just type :LinkToCodeBrowser or the
" smallest which will not be ambiguous. As of today just :Li is sufficient
source ~/.vim/plugin/LinkToCodeBrowser.vim

""""""""" COPIED From Vundle repository: https://github.com/VundleVim/Vundle.vim


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Pritesh: The plugins I have added.

"1. https://github.com/octol/vim-cpp-enhanced-highlight
" DISABLED
"Plugin 'octol/vim-cpp-enhanced-highlight'

"2. The NERDTree is a file system explorer for the Vim editor
"
Plugin 'preservim/nerdtree'

"3. DISABLED
"Plugin 'valloric/youcompleteme'

"4 Git commands from vim. https://vimawesome.com/plugin/fugitive-vim
Plugin 'tpope/vim-fugitive'

"5 ack.vim plugin to use the silver searcher tool. https://github.com/mileszs/ack.vim
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""" COPY 1 END

" Plugin specific commands:

" NERDTree plugin options.
" autocmd vimenter * NERDTree                    " Open nerdTree by default.

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('h', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('hpp', 'Magenta', 'none', '#ff00ff', '#151515')




"""""""" PRITESH RANJAN MY ADDITIONS FROM NOW ON
" A good virmc https://dougblack.io/words/a-good-vimrc.html
" How to do 90% of what plugins do with just vim https://www.youtube.com/watch?v=XA2WjJbmmoM
colorscheme slate
set path+=**

syntax enable                                   " enable syntax processing

map <F7> :tabp<CR>
map <F8> :tabn<CR>
" Remapped F2 for ctag
" map <F2> :echo 'Current time is ' . strftime('%c')<CR>

set number                                      " show line numbers
set showcmd                                     " show command in bottom bar on the very bottom right
set relativenumber
" set cursorline                                  " highlight current line
filetype indent on                              " load filetype-specific indent files
set wildmenu                                    " visual autocomplete for command menu
set lazyredraw                                  " redraw only when we need to.
set showmatch                                   " highlight matching [{()}]

set hlsearch                                    " Highlight matches
set incsearch                                   " search as characters are entered
set ignorecase                                  " Do case insensitive search

set expandtab                                   " tabs are spaces
set tabstop=4                                   " number of visual spaces per TAB
set softtabstop=4                               " number of spaces in tab when editing
set shiftwidth=4

set autoindent
set foldenable                  " enable folding
" set foldlevelstart=10          " open most folds by default
set foldlevelstart=5          " By default fold everything for level>=2
set foldnestmax=10              " 10 nested fold max
" space open/closes folds
nnoremap <space> za
"set foldmethod=indent           " fold based on indent level. Best for Python.
set foldmethod=syntax           " fold based on syntax. Good for C++, Java
set backspace=indent,eol,start

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","               " leader is comma

set mouse-=a    " The first line of this vimrc enables all default options. In
                " default option double click takes you to VISUAL mode. I
                " don't like this. I have iterm configured to copy for double
                " click. set mouse-=a disables that.

" Increase the current vsplit size by 10 cursor positions
nnoremap <silent> <Leader>= :exe "vertical resize +10" <CR>
nnoremap <silent> <Leader>- :exe "vertical resize -10" <CR>


" https://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow/2460593
set complete-=i

" Display the current file name at the bottom
set laststatus=2

" Use the silver searcher (Ag) with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Map F2 to search the work under cursor with ctags.
nmap <F2> <C-]>

" Autoclose curly braces. https://stackoverflow.com/a/34992101/4608878
" NOTE: This autocomplete in insert mode, provided set paste is not set.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
