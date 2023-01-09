"Capu's minimal vimrc

so /usr/share/doc/fzf/examples/fzf.vim

"vim-markdown by plasticboy (via polyglot)
let g:vim_markdown_new_list_item_indent=0
let g:vim_markdown_auto_insert_bullets=0
" netrw file browsing
let g:netrw_liststyle = 3

set wildignore+=*.class,.git,.hg,.svn,target,*.o,*.pdf,plugged,tags,*.make,node_modules,internals,abi
"grepping
set grepprg=ag\ --vimgrep\ --silent\ --ignore='*.class'\ --ignore='*.csv'\ --ignore='*.min.*'\ --ignore='*.pyc'\ --ignore='.*json'\ --ignore='.*lock$'\ -S
set grepformat=%f:%l:%c:%m
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

colorscheme space_vim_theme

set termguicolors
let mapleader=";"
let localleader=";"

set wrap lbr cpoptions+=n
set lazyredraw
set relativenumber number numberwidth=2
set foldmethod=indent foldlevelstart=99
set mouse=a
set splitbelow splitright diffopt+=vertical
syntax on 
filetype indent on
filetype plugin on 

set scrolloff=2

"autoloading: 
set autoread updatetime=7800

set wildmenu
set incsearch ignorecase smartcase hlsearch
set background=dark
set undofile undodir=~/.config/nvim/undo_history autowriteall noswapfile
set clipboard=unnamed

set listchars=tab:>-,space:· list colorcolumn=100 cursorline

"Indenting
set smartindent expandtab shiftround shiftwidth=2 softtabstop=2 tabstop=2

" MAPPINGS
"spellcheck
nnoremap zs 1z=]s
"visual    navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gV `[v`]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" resolve files inside node_modules
set suffixesadd+=.js,.jsx,.sol

function! LoadMainNodeModule(fname)
  return "./node_modules/" . a:fname
endfunction

set isfname+=@-@

" Yank things into things
nnoremap <leader>yf :let @* = expand("%")<cr>
nnoremap <leader>yF :let @* = expand("%:p")<cr>

map <leader>* *:%s///gn<CR>
nnoremap <leader>eV :e ~/.config/nvim/fat.vim<cr>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>sV :source ~/.config/nvim/fat.vim<cr>
nnoremap <leader>ef :e ~/.config/fish/config.fish<cr>
nnoremap <leader>er :e ~/.config/newsboat/urls<CR>
nnoremap <leader>ei :e ~/.config/i3/config<cr>
nnoremap <leader>ep :e ~/.config/i3blocks/config<cr>
nnoremap <leader>es :e ~/.ssh/config<cr>
nnoremap <leader>eq :e ~/.config/qutebrowser/config.py<cr>
nnoremap <leader>ea :e ~/.config/awesome/rc.lua<cr>
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
nnoremap <leader>a :Ag<cr>

nnoremap <leader>gw :grep <cword><cr>
nnoremap <leader>gW :grep '\b<cword>\b'<cr>
nnoremap <leader>gf :grep <cfile><cr>

" make heading?
nnoremap <leader>hh yypVr

nnoremap <leader>c yypV!bc -l<cr>

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
  execute "normal! o\<esc>0i" . strftime("%F-%H-%M") . ": "
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

augroup pythoncommands
    autocmd!
    autocmd BufEnter *.py setlocal keywordprg=pydoc
augroup END

augroup sentcommands
  autocmd!
  autocmd BufEnter *.sent setlocal textwidth=45
  autocmd BufEnter *.sent setlocal colorcolumn=45
augroup END

augroup tweetcommands
  autocmd!
  autocmd BufEnter tweetlater.md setlocal textwidth=280
  autocmd BufEnter tweetlater.md setlocal colorcolumn=280
augroup END

augroup typescript
    autocmd!
    autocmd BufEnter *.ts nnoremap <buffer> <C-]> :ALEGoToDefinition<cr>
augroup END

augroup othercfgs
    autocmd!
    autocmd VimEnter * echo ">^.^<"
    " If possible, save when losing/gaining focus and every updatetime
    " seconds
    autocmd CursorHold,CursorHoldI,FocusLost,FocusGained * silent! wa
    autocmd BufEnter Makefile setlocal tabstop=2 noexpandtab
augroup END

iabbrev ssig ---<cr>Saludos, Capu `>^.^<`.
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

"learn vimscript the hard way thingies
inoremap <leader><c-u> <esc>viwUA
nnoremap <leader><c-u> viwU
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>

onoremap il( :<c-u>normal! F(vi(<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap al( :<c-u>normal! F(va(<cr>
onoremap an( :<c-u>normal! f)va(<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap al{ :<c-u>normal! F{va{<cr>
onoremap an{ :<c-u>normal! f}va{<cr>


augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup javascriptcommands
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
    autocmd FileType javascript setlocal includeexpr=LoadMainNodeModule(v:fname)
augroup END

