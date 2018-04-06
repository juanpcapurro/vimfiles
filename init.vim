"Capurro's vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin()
" Heavy plugins
Plug 'Valloric/YouCompleteMe',{'do': './install.py --system-libclang --clang-completer' }
Plug 'w0rp/ale',{'do':'npm i -g eslint '}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" Simple plugins
Plug 'ludovicchabant/vim-gutentags'
Plug 'suan/vim-instant-markdown',{'do': 'npm i -g instant-markdown-d'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-fugitive'
" Language-specific plugins
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim',{'do':'npm install'}
" Beautifully simple plugins
Plug 'ton/vim-bufsurf'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/rainbow_parentheses.vim'
" Visual plugins
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set wildignore+=*.class,.git,.hg,.svn,target/**,*.o,*.pdf,plugged,tags*,*.make

"grepping
set grepprg=ag\ --vimgrep\ --silent
set grepformat=%f:%l:%c:%m
let g:tagbar_autoclose= 1

"YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_key_detailed_diagnostics = '<leader>D'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_specific_completion_to_disable = {
\     'gitcommit': 1
\   }
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

"vim-gutengags
let g:gutentags_project_root=['.git','.vimproject']
set statusline+=%{gutentags#statusline()}

" ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'c': ['cpplint'],
\   'cpp': ['cpplint']
\}
let g:ale_fixers = {
\   'javascript': [
\       'eslint'
\   ],
\}

"rainbow-parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"vimtex
let g:vimtex_view_general_viewer='zathura'

"other plugins
let g:instant_markdown_autostart = 0
let g:polyglot_disabled=['latex']
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let NERDTreeQuitOnOpen=1
let g:flow#showquickfix = 0
let g:javascript_plugin_flow = 1

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
set foldmethod=indent
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

set wildmenu
set incsearch
set ignorecase
set smartcase
set hlsearch
set background=dark
set cursorline
set undofile
set undodir=~/.config/nvim/undo_history
set autowriteall
set tags=tags

set listchars=tab:>-,space:·
set list

"Indenting
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2


"Use of system clipboard
set clipboard=unnamedplus


"specific commands by filetype
augroup javascriptcommands
    autocmd!
    autocmd BufEnter *.js,*.jsx setlocal omnifunc=tern#Complete
    "autocmd BufEnter *.js,*.jsx setlocal foldmethod=syntax
    autocmd BufEnter *.js,*.jsx nnoremap <buffer> <C-]> :TernDef<CR>
    "autocmd BufEnter *.js,*.jsx nnoremap <buffer> <C-]> :FlowJumpToDef<CR>
augroup END

augroup latexcommands
    autocmd!
    autocmd BufEnter *.tex setlocal spell
    autocmd BufEnter *.tex setlocal spelllang=es
augroup END

augroup ccppcommands
    autocmd!
    autocmd BufEnter *.cpp,*.c,*.h setlocal tabstop=4
    autocmd BufEnter *.cpp,*.c,*.h setlocal shiftwidth=4
    autocmd BufEnter *.cpp,*.c,*.h setlocal softtabstop=4
augroup END

augroup othercfgs
    autocmd!
    autocmd VimEnter * echo ">^.^<"
    autocmd VimEnter * RainbowParentheses
    autocmd FocusLost * silent! wa
    autocmd CursorHold,CursorHoldI * checktime
    autocmd FocusGained,BufEnter * :checktime
    autocmd BufEnter *.md nnoremap <buffer> <leader>cb i```<cr>```<esc>kp
    autocmd BufEnter Makefile setlocal tabstop
augroup END

"
" MAPPINGS
"

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
set diffopt+=vertical

inoremap <c-u> <esc>bveUA
nnoremap <c-u> bveU
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>et :tabnew ~/.tmux.conf<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>ei :tabnew ~/.i3/config<cr>
nnoremap <leader>ep :tabnew ~/.config/polybar/config<cr>
nnoremap <leader>en :tabnew ~/notes.md<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
nnoremap <space> za

nnoremap <leader>t :Tags<cr>
nnoremap <leader>p :Files<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>m :FZFMru<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>d :TagbarToggle<cr>
nnoremap <leader>vv :grep <cword><CR>
nnoremap <leader>vV :grep <cWORD><CR>
nnoremap <leader><space> :nohlsearch <CR>

nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap =g :GitGutterUndoHunk<cr>

nnoremap [b :BufSurfBack<cr>
nnoremap ]b :BufSurfForward<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

iabbrev ssig <cr>---<cr>Saludos, Juan Pablo.

"Source a project-specific vimrc, if it exists
silent! so .vimlocal
