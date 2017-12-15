"Capurro's vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin()
" Heavy plugins
Plug 'VundleVim/Vundle.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Valloric/YouCompleteMe',{'do': './install.py --system-libclang --js-completer --clang-completer' }
Plug 'scrooloose/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" Simple plugins
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ludovicchabant/vim-gutentags'
Plug 'suan/vim-instant-markdown',{'do': 'sudo npm i -g instant-markdown-d'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/vim-auto-save'
" Beautifully simple plugins
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-obsession'
" Visual plugins
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"ctrlp
set switchbuf=usetab
set wildignore+=*.class,.git,.hg,.svn,target/**,*.o,*.pdf,plugged,tags*,*.make
nnoremap <leader>t :Tags<cr>
nnoremap <leader>p :Files<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>m :FZFMru<cr>
let g:ctrlp_map = '<leader>p'
let g:ctrlp_extensions = ['tag', 'quickfix', 'jumplist']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
let g:ctrlp_user_command = {
  \ 'types': {
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

"grepping
set grepprg=ag\ --vimgrep\ --skip-vcs-ignores\ --nocolor\ --word-regexp\ --silent\ --literal
set grepformat=%f:%l:%c:%m
nnoremap <leader>vv :grep <cword><CR>
nnoremap <leader>vV :grep <cWORD><CR>

"Tagbar
nnoremap <leader>d :TagbarToggle<cr>
let g:tagbar_autoclose= 1

"YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_key_detailed_diagnostics = '<leader>D'
let g:ycm_confirm_extra_conf = 0

"vim-gutengags
let g:gutentags_project_root=['.git','.vimproject']
set statusline+=%{gutentags#statusline()}

"other plugins
let g:auto_save = 1
let g:livepreview_previewer = 'zathura'
let g:instant_markdown_autostart = 0
cnoreabbrev tab Tabularize /

"Visual settings
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   },
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
colorscheme PaperColor
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

let mapleader = ";"
let localleader = ";"
set wrap lbr
set lazyredraw
set relativenumber
set number
set numberwidth=1
set foldmethod=syntax
set foldlevelstart=99
set mouse=a
set noswapfile
syntax on 
filetype indent on
filetype plugin on 

" tag jumping
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap <C-]> <C-]>zz

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
set tags=tags

"Indenting
set autoindent
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
nnoremap tt :tab split <CR>
nnoremap Q :q<CR>
set splitbelow

inoremap <c-u> <esc>bveUA
nnoremap <c-u> bveU
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>et :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>ei :tabnew ~/.i3/config<cr>
nnoremap <leader>en :tabnew ~/notes.md<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>/ <esc>'<O/*<esc>'>o*/<esc>
nnoremap <leader>nt d0i<tab>def ""(){<cr>}<esc>k0wwa
nnoremap <leader>f :NERDTreeToggle<cr>
inoremap jk <esc>
nnoremap <space> za
nnoremap <leader>cb i```<cr>```<esc>kp

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

"Source a project-specific vimrc, if it exists
silent! so .vimlocal
