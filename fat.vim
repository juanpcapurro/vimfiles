"Capu's vimrc
so ~/.config/nvim/init.vim

packadd ale
packadd vim-airline
packadd vim-airline-themes
packadd vim-gitgutter

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

nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>sV :source ~/.config/nvim/fat.vim<cr>

nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap =g :GitGutterUndoHunk<cr>

nnoremap ]a :ALENext<CR>
nnoremap [a :ALEPrevious<CR>
nnoremap =a :ALEFix<CR>
