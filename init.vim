"Capurro's vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin()
" Heavy plugins
Plug 'Valloric/YouCompleteMe',{'do': './install.py --system-libclang --clang-completer' }
Plug 'w0rp/ale',{'branch': 'master'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'scrooloose/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" Simple plugins
Plug 'ludovicchabant/vim-gutentags'
Plug 'jamesroutley/vim-logbook'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-fugitive'
" Language-specific plugins
Plug 'lervag/vimtex'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ternjs/tern_for_vim'
" Plug 'flowtype/vim-flow',{'do': 'npm i -g flow-bin'}
Plug 'Valloric/MatchTagAlways'
Plug 'curist/vim-angular-template'
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'JulesWang/css.vim'
" Beautifully simple plugins
Plug 'jeetsukumaran/vim-indentwise'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
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
set grepprg=ag\ --vimgrep\ --silent\ --ignore='*.class'\ --ignore='*.csv'\ --ignore='*.min.*'\ --ignore='*.pyc'\ -S
set grepformat=%f:%l:%c:%m
set path+=**
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
let g:gutentags_enabled=1
let g:gutentags_project_root=['.git','.vimproject']

" ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'java': [],
\   'c': ['cpplint', 'cppcheck'],
\   'cpp': ['cpplint', 'cppcheck']
\}
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'css': ['stylelint'],
\   'javascript': ['eslint']
\}

"rainbow-parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"vimtex
let g:vimtex_view_general_viewer='zathura'

"vim-markdown by plasticboy (via polyglot)
let g:vim_markdown_new_list_item_indent=0
let g:vim_markdown_auto_insert_bullets=0

"other plugins
let g:instant_markdown_autostart = 0
let g:polyglot_disabled= ['latex']
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let NERDTreeQuitOnOpen=1
" let g:flow#showquickfix = 0
" let g:flow#showquickfix = 0
" let g:javascript_plugin_flow = 0
let g:used_javascript_libs = 'angular'

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
let g:airline_powerline_fonts = 0
let g:airline_theme='minimalist'
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#hunks#enabled = 0

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
set splitbelow
set splitright
set diffopt+=vertical
syntax on 
filetype indent on
filetype plugin on 

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
set clipboard=unnamed

set listchars=tab:>-,space:·
set list

"Indenting
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"specific commands by filetype
augroup javascriptcommands
    autocmd!
    autocmd BufEnter *.js,*.jsx setlocal omnifunc=tern#Complete
    autocmd BufEnter *.js,*.jsx setlocal foldmethod=syntax
    autocmd BufEnter *.js,*.jsx nnoremap <buffer> <C-]> :TernDef<CR>
    "autocmd BufEnter *.js,*.jsx nnoremap <buffer> <C-]> :FlowJumpToDef<CR>
augroup END
augroup python
    autocmd!
    autocmd BufEnter *.py setlocal foldmethod=indent
    "autocmd BufEnter *.py nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
augroup END

augroup markdown
    autocmd!
    autocmd BufEnter *consulta.md,*respuesta.md,feedback.md setlocal nocursorline
    autocmd BufEnter *consulta.md,*respuesta.md,feedback.md setlocal spell
    autocmd BufEnter *consulta.md,*respuesta.md,feedback.md setlocal spelllang=es
    autocmd BufEnter *.md nnoremap <buffer> <leader>cb i```<cr>```<esc>kp
    autocmd BufEnter *.md nnoremap <buffer> <leader>cB i```<cr>```<esc>k"+p
    autocmd BufEnter *.md nnoremap <buffer> <leader>i o- [  ] 
    autocmd BufEnter *.md nnoremap <buffer> <leader>I o<tab>- [  ] 
    autocmd BufEnter *.md nnoremap <buffer> <leader>d 0f]hix<esc>
    autocmd BufEnter *.md setlocal tabstop=4
    autocmd BufEnter *.md setlocal shiftwidth=4
    autocmd BufEnter *.md setlocal softtabstop=4
augroup END

augroup latexcommands
    autocmd!
    autocmd BufEnter *.tex setlocal spell
    autocmd BufEnter *.tex setlocal spelllang=es
augroup END

augroup ccppcommands
    autocmd!
    autocmd BufEnter *.cpp,*.c,*.h setlocal tabstop=2
    autocmd BufEnter *.cpp,*.c,*.h setlocal shiftwidth=2
    autocmd BufEnter *.cpp,*.c,*.h setlocal softtabstop=2
    autocmd BufEnter *.cpp,*.c,*.h let g:gutentags_enabled=1
augroup END

augroup othercfgs
    autocmd!
    autocmd VimEnter * echo ">^.^<"
    autocmd VimEnter * RainbowParentheses
    autocmd FocusLost * silent! wa
    "autocmd CursorHold,CursorHoldI * checktime
    autocmd FocusGained,BufEnter * :checktime
    autocmd BufEnter Makefile setlocal tabstop=2 noexpandtab
augroup END

"
" MAPPINGS
"
"
"spellcheck
nnoremap zs 1z=]s

"visual    navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gV `[v`]
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"Navigation of splits

" Yank things into things
nmap <leader>cf :let @* = expand("%")<cr>
nmap <leader>cF :let @* = expand("%:p")<cr>

map <leader>* *:%s///gn<CR>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
nnoremap <leader>eZ :e ~/.zshenv<cr>
nnoremap <leader>ei :e ~/.config/i3/config<cr>
nnoremap <leader>ep :e ~/.config/i3blocks/config<cr>
nnoremap <leader>en :FZF! ~/notes <CR>
nnoremap <leader>eN :e ~/notes/
nnoremap <leader>et :FZF! ~/todos <CR>
nnoremap <leader>eT :e ~/todos/
inoremap jk <esc>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nnoremap <leader>t :Tags<cr>
nnoremap <leader>p :Files<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>m :FZFMru<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :NERDTreeToggle<cr>
nnoremap <leader>d :TagbarToggle<cr>

nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap =g :GitGutterUndoHunk<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

iabbrev ssig <cr>---<cr>Saludos, Juan Pablo `>^.^<`.
iabbrev :sparkle: ✨
iabbrev :upsidedown: 🙃
iabbrev :catsmile: 😺
iabbrev :lewd: 😏
iabbrev :sob: 😭
iabbrev :think: 🤔
iabbrev :shrug: ¯\\_(ツ)_/¯
iabbrev :wink: 😉


"Source a project-specific vimrc, if it exists
silent! so .vimlocal
