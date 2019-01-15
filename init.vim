"Capurro's vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

so ~/.config/nvim/minimal.vim

call plug#begin('~/.config/nvim/plugged_all')
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
Plug 'juanpcapurro/vim-logbook'
Plug 'tpope/vim-fugitive'
Plug 'juanpcapurro/vim-logbook'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'JulesWang/css.vim'
" Language-specific plugins
Plug 'lervag/vimtex'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ternjs/tern_for_vim'
" Plug 'flowtype/vim-flow',{'do': 'npm i -g flow-bin'}
Plug 'curist/vim-angular-template'
"Plug 'Glench/Vim-Jinja2-Syntax'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


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
nnoremap ]a :ALENext<CR>
nnoremap [a :ALEPrevious<CR>
nnoremap =a :ALEFix<CR>
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 0

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

