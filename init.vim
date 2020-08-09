"init.vim de code_krosis en windows
" __                        .__              .__
"|  | _________  ____  _____|__| _________  _|__| ____________   ____
"|  |/ /\_  __ \/  _ \/  ___/  |/  ___/\  \/ /  |/     \_  __ \_/ ___\
"|    <  |  | \(  <_> )___ \|  |\___ \  \   /|  |  Y Y  \  | \/\  \___
"|__|_ \ |__|   \____/____  >__/____  >  \_/ |__|__|_|  /__|    \___  >
"     \/                  \/        \/                \/            \/
"
call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }    "file explorer
Plug 'dikiaap/minimalist'                                "main theme
Plug 'sheerun/vim-polyglot'                              "syntax hightlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}          "syntax autocomplete
Plug 'tpope/vim-fugitive'                                "Git Integration on vim
Plug 'vim-airline/vim-airline'                           "Git status bar
Plug 'airblade/vim-gitgutter'                            "Git number-column changes
Plug 'alvan/vim-closetag'                                "tags autocomplete
Plug 'tpope/vim-surround'                                "allow sorrounding
Plug 'tpope/vim-commentary'                              "allow comments blocks
Plug 'ctrlpvim/ctrlp.vim'                                "fuzzy file finding
Plug 'ryanoasis/vim-devicons'                            "icons for files(need nerdfont)
call plug#end()
"code snipets para estos lenguajes
let g:coc_global_extensions = [
                            \ 'coc-html',
                            \ 'coc-css',
                            \ 'coc-clangd',
                            \ 'coc-emmet',
                            \ 'coc-pairs',
                            \ 'coc-tsserver',
                            \ 'coc-markdownlint'
                            \ ]
"filter git files from fuzzy finding
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"especificaciones basicas
set number relativenumber
set encoding=utf-8
syntax on
set termguicolors
colorscheme minimalist
set hidden
"tab settings
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set noswapfile
set incsearch
set smartindent
set cursorline
set cursorcolumn
"allows coc servers to work fine
set nobackup
set nowritebackup
set cmdheight=2
"enable default autocompletion
set wildmode=longest,list,full
"change default split screen layout
set splitbelow splitright
"system clipboard = vim clipboard
set clipboard+=unnamedplus
"vertically center document when insert mode
autocmd InsertEnter * norm zz
"bloquear o remapear teclas
let mapleader = " "
"atajo para normal mode
inoremap jk <ESC>
inoremap kj <ESC>
"atajo para visual mode
vmap < <gv
vmap > >gv
"guardar mas rapido
nnoremap <C-s> :w<CR>
"abrir un vsplit
nnoremap <leader>pv :wincmd v<CR>
"movimiento entre split screens
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
"resize windows
nnoremap <Tab><Left> :vertical resize +5<CR>
nnoremap <Tab><Right> :vertical resize -5<CR>
"desabilita las arrow keys. Aprende vim -__-
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
"REMAPEO_SABROSO de find&replace
nnoremap S :%s//g<left><left><left>
"SETTINGS SABROSO DE VIM-POLYGLOT
" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
"REMAPEO_SABROSO DE NERDTREE
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree "nerdtree abre por defecto
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "sino hay ventanas excepto nerdtree, cierra vim
"REMAPEO_SABROSO DE VIM-FUGITIVE
"atajo para git status
nmap <leader>gs :G<CR>
"diffget lo que esta a la derecha
nmap <leader>gh :diffget //3<CR>
"diffget lo que esta a la izquierda
nmap <leader>gf :diffget //2<CR>
"GitGutter remaps & config
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight! link SignColumn LineNr
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
" vim-airline integration
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
"REMAPEO_SABROSO OF COC-PLUGIN
:verbose imap <tab>
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

function! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

"allows for cut empty whitespace from endlines
autocmd BufWritePre * :call TrimWhiteSpace()
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"---SETUP  for CLOSE-TAGS
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsp'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.jsp'
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,jsp'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,jsp'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
"default
"let g:closetag_close_shortcut = '<leader>>'
let g:closetag_close_shortcut = '.>'





