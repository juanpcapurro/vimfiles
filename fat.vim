"Capurro's vimrc
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

so ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged_all')
" Heavy plugins
Plug 'w0rp/ale',{'branch': 'master'}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
" Simple plugins
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Valloric/MatchTagAlways'
" Beautifully simple plugins
Plug 'jeetsukumaran/vim-indentwise'
Plug 'milkypostman/vim-togglelist'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-theme'
call plug#end()

" UltiSnips
let g:UltiSnipsEditSplit="vertical"

" ALE
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier_eslint', 'prettier', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint'],
\   'python': ['flake8'],
\   'java': [],
\   'html': ['prettier'],
\   'c': ['cpplint', 'cppcheck', 'gcc'],
\   'solidity': ['solhint'],
\   'cpp': ['cpplint', 'cppcheck', 'gcc']
\}
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'css': ['stylelint'],
\   'solidity': ['prettier'],
\   'scss': ['stylelint'],
\   'typescript': ['eslint','tslint'],
\   'html': ['prettier'],
\   'typescriptreact': ['eslint'],
\   'javascript': ['eslint', 'prettier_eslint', 'prettier'],
\}
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 0
 
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

"Visual settings
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
    autocmd BufEnter *.js,*.jsx setlocal foldmethod=syntax
augroup END
augroup python
    autocmd!
    autocmd BufEnter *.py setlocal foldmethod=indent
augroup END
augroup typescript
    autocmd!
    autocmd BufEnter *.ts nnoremap <buffer> <C-]> :ALEGoToDefinition<cr>
augroup END

nnoremap <leader>sv :source ~/.config/nvim/fat.vim<cr>

nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap =g :GitGutterUndoHunk<cr>

nnoremap ]a :ALENext<CR>
nnoremap [a :ALEPrevious<CR>
nnoremap =a :ALEFix<CR>
