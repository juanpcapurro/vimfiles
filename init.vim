"Capurro's minimal vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged_minimal')
" Heavy-esque plugins
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" Simple plugins
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
call plug#end()

so /usr/share/doc/fzf/examples/fzf.vim

"vim-markdown by plasticboy (via polyglot)
let g:vim_markdown_new_list_item_indent=0
let g:vim_markdown_auto_insert_bullets=0
" netrw file browsing
let g:netrw_liststyle = 3

set wildignore+=*.class,.git,.hg,.svn,target,*.o,*.pdf,plugged,tags,*.make,node_modules,internals
"grepping
set grepprg=ag\ --vimgrep\ --silent\ --ignore='*.class'\ --ignore='*.csv'\ --ignore='*.min.*'\ --ignore='*.pyc'\ -S
set grepformat=%f:%l:%c:%m
set path+=**
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

colorscheme pablo

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
set updatetime=7800

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
set colorcolumn=100

"Indenting
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" MAPPINGS
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

" Yank things into things
nnoremap <leader>yf :let @* = expand("%")<cr>
nnoremap <leader>yF :let @* = expand("%:p")<cr>

map <leader>* *:%s///gn<CR>
nnoremap <leader>eV :e ~/.config/nvim/fat.vim<cr>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>
nnoremap <leader>eZ :e ~/.zshenv<cr>
nnoremap <leader>ei :e ~/.config/i3/config<cr>
nnoremap <leader>ep :e ~/.config/i3blocks/config<cr>
nnoremap <leader>es :e ~/.ssh/config<cr>
nnoremap <leader>eq :e ~/.config/qutebrowser/config.py<cr>
nnoremap <leader>ex :e ~/.config/sxhkd/sxhkdrc<cr>
nnoremap <leader>en :FZF! ~/notes <CR>
nnoremap <leader>eN :e ~/notes/
nnoremap <leader>et :FZF! ~/todos <CR>
nnoremap <leader>eT :e ~/todos/
inoremap jk <esc>


nnoremap <leader>t :Tags<cr>
nnoremap <leader>p :Files<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>m :FZFMru<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :TagbarToggle<cr>
nnoremap <leader>a :Ag<cr>

nnoremap <leader>gw :grep <cword><cr>
nnoremap <leader>gW :grep '\b<cword>\b'<cr>
nnoremap <leader>gf :grep <cfile><cr>

" make heading?
nnoremap <leader>hh yypVr

" Lists and timestamps
nnoremap <leader>i o- [ ] 
nnoremap <leader>I O- [ ] 
nnoremap <leader><leader>i o<tab>- [ ] 
nnoremap <leader><leader>I O<tab>- [ ] 
nnoremap <leader>d 0f]hrx

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Allow saving of files with sudo when I forgot to start vim as root.
cmap w!! w !sudo tee > /dev/null %

nnoremap <leader>ww :w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wm :wa<cr>:make<cr>

" I used to use vim-logbook, but copy-pasting feels better
" Open today's logbook in the current buffer
function! OpenLogbook()
  let logfile = "~/logbook/" . strftime("%F") . ".md"
  execute "edit " . logfile
endfunction
" Open today's time log in the current buffer
function! OpenTimelog()
  let logfile = "~/timelog/" . strftime("%F")
  execute "edit " . logfile
endfunction
" Insert a timestamp under the cursor
function! WriteTimestamp()
  execute "normal! o\<esc>0i" . strftime("%c") . "\n"
endfunction

command! -nargs=0 Lb call OpenLogbook()
command! -nargs=0 Lt call OpenTimelog()
command! -nargs=0 Ts call WriteTimestamp()

augroup markdown
    autocmd!
    autocmd BufEnter *.md nnoremap <buffer> <leader>t :Ts <cr>a
augroup END

augroup plaintext
    autocmd!
    autocmd Filetype rst,email,markdown setlocal tabstop=4
    autocmd Filetype rst,email,markdown setlocal shiftwidth=4
    autocmd Filetype rst,email,markdown setlocal softtabstop=4
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

augroup soliditycommands
    autocmd!
    autocmd BufEnter *.sol setlocal makeprg=truffle\ compile\ --all\ \\\|grep\ -P\ '(?<=\ )/.*$'
augroup END

augroup sentcommands
  autocmd!
  autocmd BufEnter *.sent setlocal textwidth=45
  autocmd BufEnter *.sent setlocal colorcolumn=45
augroup END

augroup othercfgs
    autocmd!
    autocmd VimEnter * echo ">^.^<"
    " If possible, save when losing/gaining focus and every updatetime
    " seconds
    autocmd CursorHold,CursorHoldI,FocusLost,FocusGained * silent! wa
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

iabbrev dsc describe('', () => {});<esc>2F'a
iabbrev tst test('', () => {});<esc>2F'a
iabbrev itt it('', () => {});<esc>2F'a
iabbrev bfa beforeAll(() => {});<esc>F{a
iabbrev bff before(() => {});<esc>F{a

"Source a project-specific vimrc, if it exists
silent! so .vimlocal
