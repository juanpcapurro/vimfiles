"Capurro's minimal vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged_minimal')
" Heavy-esque plugins
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" Simple plugins
Plug 'juanpcapurro/vim-logbook'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'JulesWang/css.vim'
" Beautifully simple plugins
Plug 'jeetsukumaran/vim-indentwise'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-tmux-navigator'
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
call plug#end()
set wildignore+=*.class,.git,.hg,.svn,target/**,*.o,*.pdf,plugged,tags*,*.make

"grepping
set grepprg=ag\ --vimgrep\ --silent\ --ignore='*.class'\ --ignore='*.csv'\ --ignore='*.min.*'\ --ignore='*.pyc'\ -S
set grepformat=%f:%l:%c:%m
set path+=**

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
set updatetime=2000

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
nnoremap <leader>eV :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>ev :e ~/.config/nvim/minimal.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/minimal.vim<cr>
nnoremap <leader>sV :source ~/.config/nvim/init.vim<cr>
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
    autocmd FocusLost,InsertLeave,WinLeave,BufLeave,TabLeave * silent! wa
    autocmd CursorHold,CursorHoldI * silent! checktime
    autocmd CursorHold,CursorHoldI * silent! wa
    autocmd FocusGained,BufEnter * silent! checktime
    autocmd BufEnter Makefile setlocal tabstop=2 noexpandtab
augroup END

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
