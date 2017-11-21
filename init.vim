"Capurro's vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'wincent/command-t',{'do': 'cd ruby/command-t/ext/command-t; make clean; ruby extconf.rb && make'}
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'dkprice/vim-easygrep'
Plug 'ludovicchabant/vim-gutentags'
Plug 'suan/vim-instant-markdown',{'do': 'sudo npm i -g instant-markdown-d'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'vim-scripts/vim-auto-save'
Plug 'Valloric/YouCompleteMe',{'do': './install.py' }
call plug#end()

"CommandT
set switchbuf=usetab
set wildignore+=*.class,.git,.hg,.svn,target/**,*.o,*.pdf,plugged
let g:CommandTFileScanner='git'
let g:CommandTAcceptSelectionCommand='e'
let g:CommandTAcceptSelectionSplitCommand='split'
let g:CommandTAcceptSelectionVSplitCommand='vs'
let g:CommandTAcceptSelectionTabCommand='tabnew'
let g:CommandTSCMDirectories='.git,.hg,.svn,.bzr,_darcs,.vimproject'

"YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1

"vim-gutengags
let g:gutentags_project_root=['.git','.vimproject']
set statusline+=%{gutentags#statusline()}

"EasyGrep
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1

"other plugins
let g:gruvbox_contrast_dark="hard"
let g:airline#extensions#tabline#enabled = 1
let g:auto_save = 1
let g:livepreview_previewer = 'zathura'
let g:instant_markdown_autostart = 0
let g:markdown_folding = 1
cnoreabbrev tab Tabularize /

let mapleader = ";"
let localleader = ";"
set wrap lbr
set relativenumber
set number
set numberwidth=1
set foldmethod=syntax
set foldlevelstart=0
set mouse=a
set noswapfile
set omnifunc=syntaxcomplete#Complete
syntax on 
colorscheme gruvbox
filetype indent on
filetype plugin on 

"autoloading: 
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

set wildmenu
set incsearch
set ignorecase
set smartcase
set hlsearch
set background=dark
set cursorline
set autowriteall

"Indenting
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

nnoremap <leader><space> :nohlsearch <CR>

"Use of system clipboard
set clipboard=unnamedplus

"specific commands by filetype
augroup cfggroup
    autocmd!
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd BufEnter *.js setlocal tabstop=2
    autocmd BufEnter *.js setlocal shiftwidth=2
    autocmd BufEnter *.js setlocal softtabstop=2
    autocmd BufEnter *.html setlocal tabstop=2
    autocmd BufEnter *.html setlocal shiftwidth=2
    autocmd BufEnter *.html setlocal softtabstop=2
augroup END

"visual    navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap J gt
nnoremap K gT

nnoremap gV `[v`]

"Navigation of splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap tt :tab split <CR>
nnoremap Q :q<CR>
set splitbelow


nnoremap <leader>l :CommandTLine<cr>
nnoremap <leader>m :CommandTMRU<cr>

inoremap <c-u> <esc>bveUA
nnoremap <c-u> bveU
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>ei :tabnew ~/.i3/config<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>/ <esc>'<O/*<esc>'>o*/<esc>
nnoremap <leader>nt d0i<tab>def ""(){<cr>}<esc>k0wwa
nnoremap <leader>f :NERDTreeToggle<cr>
inoremap jk <esc>
nnoremap <space> za

cnoreabbrev mks mksession!

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

iabbrev ssig <cr>---<cr>Saludos, Juan Pablo.

autocmd VimEnter * echo ">^.^<"

"Terminal mode
:tnoremap <Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>
