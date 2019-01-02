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
