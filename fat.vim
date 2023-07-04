"Capu's vimrc
so ~/.config/nvim/init.vim

packadd ale
packadd vim-gitgutter

nnoremap <leader>sv :source ~/.config/nvim/fat.vim<cr>

" ALE: {{{
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier_eslint', 'prettier', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint'],
\   'python': ['flake8'],
\   'java': ['javac'],
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

nnoremap ]a :ALENext<CR>
nnoremap [a :ALEPrevious<CR>
nnoremap =a :ALEFix<CR>
set omnifunc=ale#completion#OmniFunc
" }}}

" GitGutter {{{
let g:gitgutter_map_keys = 0
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap =g :GitGutterUndoHunk<cr>
" }}}

