"Capu's vimrc
so ~/.config/nvim/init.vim

packadd ale
packadd nvim-lspconfig
packadd vim-gitgutter

nnoremap <leader>Sv :source ~/.config/nvim/fat.vim<cr>

" ALE: {{{
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier_eslint', 'prettier', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint'],
\   'python': ['flake8'],
\   'java': ['javac'],
\   'rust': ['cargo', 'rust-analyzer'],
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
\   'rust': ['rustfmt'],
\   'typescriptreact': ['eslint'],
\   'javascript': ['eslint', 'prettier_eslint', 'prettier'],
\}
let g:ale_set_loclist  = 1
let g:ale_set_quickfix = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

nnoremap =a :ALEFix<CR>
" }}}

" GitGutter: {{{
let g:gitgutter_map_keys = 0
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>
nnoremap =g :GitGutterUndoHunk<cr>
nnoremap =G :GitGutterStageHunk<cr>
" }}}

" {{{ LSP:

lua << EOF
local lspconfig = require 'lspconfig'

lspconfig.rust_analyzer.setup {}
lspconfig.tsserver.setup {}
lspconfig.solidity_ls_nomicfoundation.setup {}
lspconfig.esbonio.setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'g<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>C', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
      -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', '<leader>f', function()
      -- vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
EOF
" }}}
