"Capu's minimal vimrc
let mapleader=";"
let localleader=";"

" Config for plugins {{{
so /usr/share/doc/fzf/examples/fzf.vim
" netrw file browsing
let g:netrw_liststyle = 3
let g:UltiSnipsEditSplit="vertical"
" }}}

" Finding and listing stuff {{{
set wildignore+=*.class,.git,.hg,.svn,target,*.o,*.pdf,plugged,tags,*.make,node_modules,internals,abi
"grepping
set grepprg=ag\ --vimgrep\ --silent\ --ignore='*.class'\ --ignore='*.csv'\ --ignore='*.min.*'\ --ignore='*.pyc'\ --ignore='.*json'\ --ignore='.*lock$'\ -S
set grepformat=%f:%l:%c:%m
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set wildmenu
set incsearch ignorecase smartcase hlsearch

nnoremap <leader>T :Tags<cr>
nnoremap <leader>p :Files<cr>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>m :FZFMru<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>a :Ag<cr>

nnoremap <leader>gw :grep <cword><cr>
nnoremap <leader>gW :grep '\b<cword>\b'<cr>
nnoremap <leader>gf :grep <cfile><cr>
" }}}

" Cosmetic & visualization things {{{
colorscheme space_vim_theme
set wrap lbr relativenumber number numberwidth=2
set lazyredraw
set mouse=a
set splitbelow splitright diffopt+=vertical
set scrolloff=3
set background=dark
set listchars=tab:>-,space:· list colorcolumn=80 cursorline

augroup onlyOnInit " prevent further sourcings of this file from overriding vim-airline
  autocmd VimEnter * set statusline=%y "[filetype]
  autocmd VimEnter * set statusline+=%q\  "[quickfix] of [location]
  autocmd VimEnter * set statusline+=%.45f\  "truncated filename
  autocmd VimEnter * set statusline+=%r%m "[RO] for readonly [+] when file is modified
  autocmd VimEnter * set statusline+=%w "preview flag
  autocmd VimEnter * set statusline+=%= "define the right side
  autocmd VimEnter * set statusline+=%l:%c/%L\  "current line : column / total lines
  autocmd VimEnter * set statusline+=%B "hexadecimal value of character under cursor utf-8 aware
augroup END
" }}}

" Behaviour settings {{{
filetype indent on
filetype plugin on
set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevelstart=99
set autoread updatetime=7800
set undofile undodir=~/.config/nvim/undo_history autowriteall noswapfile
set clipboard=unnamed
set smartindent expandtab shiftround shiftwidth=2 softtabstop=2 tabstop=2
augroup autosave
  autocmd!
  " If possible, save when losing/gaining focus and every updatetime seconds
  autocmd CursorHold,CursorHoldI,FocusLost,FocusGained * silent! wa
augroup END
" }}}

" Mappings: do-this-thing style {{{
"spellcheck
nnoremap zs 1z=]s
"visual    navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap \ ;
nnoremap gV `[v`]
nnoremap <leader>o :only<CR>
nnoremap <leader>O :BufOnly<CR>
nnoremap <leader><C-]> :only<CR> :vs<cr> <C-]>
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
inoremap jk <esc>
" Yank things into things
nnoremap <leader>yf :let @* = expand("%") . ":" . line('.')<cr>
nnoremap <leader>yF :let @* = expand("%:p") . ":" . line('.')<cr>
"make section
nnoremap <leader>s yypVr-
inoremap <C-s> <esc>yypVr-o
"evaluate as math
nnoremap <leader>c yypV!bc -l<cr>
" }}}

" Mappings: text modification {{{
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)
nnoremap <leader>ww :w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wm :wa<cr>:make<cr>
" }}}

" Mappings: opening various files {{{
nnoremap <leader>eV :e ~/.config/nvim/fat.vim<cr>
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>Sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>SV :source ~/.config/nvim/fat.vim<cr>
nnoremap <leader>ef :e ~/.config/fish/config.fish<cr>
nnoremap <leader>er :e ~/.config/newsboat/urls<CR>
nnoremap <leader>es :e ~/.ssh/config<cr>
nnoremap <leader>eq :e ~/.config/qutebrowser/config.py<cr>
nnoremap <leader>ea :e ~/.config/awesome/rc.lua<cr>
nnoremap <leader>ex :e ~/.config/sxhkd/sxhkdrc<cr>
nnoremap <leader>en :FZF! ~/notes <CR>
nnoremap <leader>eN :e ~/notes/
nnoremap <leader>et :FZF! ~/todos <CR>
nnoremap <leader>eT :e ~/todos/
" }}}

" Ad-hoc-features: {{{

" Journaling: {{{
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

nnoremap <leader>i o- [ ] 
nnoremap <leader>I O- [ ] 
nnoremap <leader><leader>i o<tab>- [ ] 
nnoremap <leader><leader>I O<tab>- [ ] 
"mark as done
nnoremap <leader>d 0f]hrx

augroup journaling
    autocmd filetype markdown nnoremap <buffer> <leader>t :Ts <cr>a
augroup  END
" }}}

" Navigate to npm dependencies on gf {{{
" resolve files inside node_modules
set suffixesadd+=.js,.jsx,.sol
function! LoadMainNodeModule(fname)
  return "./node_modules/" . a:fname
endfunction
set isfname+=@-@

augroup manIHateJs
    autocmd!
    autocmd FileType javascript,typescript setlocal includeexpr=LoadMainNodeModule(v:fname)
augroup END
" }}}

" }}}

" Filetype specific autocommands {{{
augroup filetypes
  autocmd!
  autocmd filetype markdown onoremap <buffer> ih :<c-u>execute "normal! ?^[-=]\\{2,}$\r:nohlsearch\rkvg_"<cr>
  autocmd filetype markdown onoremap <buffer> ah :<c-u>execute "normal! ?^[-=]\\{2,}$\r:nohlsearch\rg_vk0"<cr>
  autocmd filetype rst,email,markdown setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80 colorcolumn=80
  autocmd filetype Makefile setlocal tabstop=2 noexpandtab
  " useful for my java makefile setup, useless for the '''real world'''
  autocmd filetype java let b:ale_java_javac_sourcepath="."
  autocmd filetype sent setlocal textwidth=45
  autocmd filetype sent setlocal colorcolumn=45
  autocmd bufenter tweetlater.md setlocal textwidth=280
  autocmd bufenter tweetlater.md setlocal colorcolumn=280
  autocmd filetype typescript nnoremap <buffer> <C-]> :ALEGoToDefinition<cr>
  autocmd filetype vim,lua setlocal foldlevelstart=0 foldmethod=marker
  autocmd filetype solidity setlocal errorformat^=%E%*[^e]error[%n]:\ %m,%Z%*[^>]>\ %f:%l:%c:
  autocmd filetype solidity setlocal makeprg=forge\ build
  autocmd filetype solidity setlocal commentstring=//\ %s
  "byte number in file, for those 'parsing error at position X' kind of days
  autocmd filetype json setlocal statusline+=(%o)
  autocmd bufwritepost *.snippets call UltiSnips#RefreshSnippets()
augroup END

augroup gui
  autocmd!
  autocmd UIEnter * source ~/.config/nvim/fat.vim
augroup END

" }}}

" Abbreviations: {{{
iabbrev ssig ---<cr>Saludos, Capu `>^.^<`.
iabbrev :sparkle: ✨
iabbrev :upsidedown: 🙃
iabbrev :catsmile: 😺
iabbrev :lewd: 😏
iabbrev :sob: 😭
iabbrev :think: 🤔
iabbrev :shrug: ¯\\_(ツ)_/¯
iabbrev :wink: 😉
" }}}

" Text objects {{{
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap al( :<c-u>normal! F(va(<cr>
onoremap an( :<c-u>normal! f)va(<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap al{ :<c-u>normal! F{va{<cr>
onoremap an{ :<c-u>normal! f}va{<cr>
onoremap in@ :<c-u>execute "normal! /\\<[[:alnum:]]\\{2,}@[[:alnum:]]\\{2,}\\.[[:alnum:]]\\{2,}\\>\r:nohlsearch\rvE"<cr>
" }}}

" Lua config for nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {enable = true},
  highlight = {enable = true},
  indent = {enable = true},
}
EOF

"Source a project-specific vimrc, if it exists
silent! so .vimlocal
