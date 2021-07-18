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

if has('win32')
    call plug#begin('~/Appdata/Local/nvim/plugged')
elseif has('unix')
    call plug#begin('~/.config/nvim/plugged')
endif
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
if has("nvim")
    "telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "telescope extensions
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'fannheyward/telescope-coc.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    "tree-sitter
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
"themes
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

augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END

"----Cheatsh trick
function Cheat(query)
  let query = 'cheat.sh/' . a:query
  execute 'split | term curl ' . query
  execute 'resize ' . string(&lines/3)
endfunction

command! -nargs=1 CheatSh call Cheat(<q-args>)
nnoremap <leader>ch :CheatSh <C-R>=&filetype<CR>/
