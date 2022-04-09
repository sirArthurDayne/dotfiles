lua require("krosis")
" must have remaps
nnoremap <C-n> :lua require('krosis.telescope').file_browser()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-g>b :lua require('krosis.telescope').git_branches()<CR>
nnoremap <C-g>c :lua require('krosis.telescope').git_commits()<CR>

" other utility remaps
nnoremap <C-_> <cmd>lua require('krosis.telescope').current_buffer()<CR>
nnoremap <leader>gf :lua require('krosis.telescope').grep_string()<CR>
nnoremap <leader>f :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>h <cmd>lua require('krosis.telescope').help_tags()<CR>
nnoremap <leader>cb <cmd>lua require('krosis.telescope').bg_selector()<CR>

"easy sourcing directories
nnoremap <F4> :lua package.loaded.krosis = nil <CR>:source ~/Appdata/Local/nvim/init.vim <CR>
nnoremap <F6> <cmd>lua require('krosis.telescope').get_dotfiles()<CR>
