" Welcome!, Welcome! to..
" __                        .__              .__
"|  | _________  ____  _____|__| _________  _|__| ____________   ____
"|  |/ /\_  __ \/  _ \/  ___/  |/  ___/\  \/ /  |/     \_  __ \_/ ___\
"|    <  |  | \(  <_> )___ \|  |\___ \  \   /|  |  Y Y  \  | \/\  \___
"|__|_ \ |__|   \____/____  >__/____  >  \_/ |__|__|_|  /__|    \___  >
"     \/                  \/        \/                \/            \/
" Filename: init.vim
" Github: https://github.com/sirArthurDayne/dotfiles
" Maintainer: sirArthurDayne/krosis
" **DISCLAMER**:My config should be the same i use on Powershell Windows (i Hope...)
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }    "file explorer
Plug 'sheerun/vim-polyglot'                              "syntax hightlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}          "syntax autocomplete
Plug 'vim-airline/vim-airline'                           "Git status bar
Plug 'airblade/vim-gitgutter'                            "Git number-column changes
Plug 'ryanoasis/vim-devicons'                            "icons for files(need nerdfont)
Plug 'alvan/vim-closetag'                                "tags autocomplete
Plug 'tpope/vim-surround'                                "allow sorrounding
Plug 'tpope/vim-fugitive'                                "Git Integration on vim
Plug 'tpope/vim-commentary'                              "allow comments blocks
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }      "fuzzy file finder
Plug 'junegunn/fzf.vim'
"Plug 'stsewd/fzf-checkout.vim'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'dikiaap/minimalist'                                "main theme
Plug 'ayu-theme/ayu-vim'                                 "second theme
" Plug 'whatyouhide/vim-gotham'
call plug#end()

"LSP setup
let g:coc_global_extensions = [
                            \ 'coc-html',
                            \ 'coc-css',
                            \ 'coc-emmet',
                            \ 'coc-pairs',
                            \ 'coc-prettier',
                            \ 'coc-tsserver',
                            \ 'coc-markdownlint',
                            \ 'coc-vetur',
                            \ 'coc-go',
                            \]


"vertically center document when insert mode
autocmd InsertEnter * norm zz

"My favorite mappings ^__^
let mapleader = " "
nnoremap <leader>vo :vsplit $MYVIMRC<CR>
inoremap jk <ESC>

"LEARN VIM -__-. arrow-keys is for cowards and normies
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

"quick line indentation
vmap < <gv
vmap > >gv
"better entire line Up or Down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"quick save
nnoremap <C-s> :w<CR>
"quick vsplit
nnoremap <leader>pv :wincmd v<CR>
"quick buffer movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
"rotate split
nnoremap <leader>r :wincmd r<CR>
"resize current buffer
nnoremap <Tab><Left> :vertical resize +5<CR>
nnoremap <Tab><Right> :vertical resize -5<CR>
"better find&replace in file
nnoremap S :%s/<C-r><C-w>//g<left><left><left>

"-----Vim-fugitive setup
"git status
nmap <leader>gs :G<CR>
"git checkout
"nmap <leader>gc :GCheckout<CR>
"diffget to the right
nmap <leader>gh :diffget //3<CR>
"diffget to the left
nmap <leader>gf :diffget //2<CR>

"-----GitGutter setup
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight! link SignColumn LineNr
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
" vim-airline integration
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

"----COC setup
:verbose imap <tab>
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" Use tab for trigger completion with characters ahead and navigate.
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
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"Auto add golang import when missing + delete it when not using it
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

"-----Extra funcionality
function! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

"allows for cut empty whitespace from endlines
augroup KROSIS
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

"better yanking experience(NEED UPDATE Neovim)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
