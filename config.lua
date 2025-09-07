" ---------- General ----------
set number
set relativenumber
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors
syntax on

" Leader key
let mapleader=" "

" ---------- Search ----------
set hlsearch
set incsearch
set ignorecase
set smartcase

" ---------- Plugins ----------
call plug#begin('~/.vim/plugged')

" File explorer (like VS Code Explorer)
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Status line (like VS Code bottom bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration (like VS Code SCM)
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Autocomplete & LSP (like IntelliSense)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clangd/coc-clangd'

" Auto-pairs (like VS Code)
Plug 'jiangmiao/auto-pairs'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" Fuzzy Finder (like VS Code Ctrl+P)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" ---------- Theme ----------
set background=dark
colorscheme gruvbox

" ---------- Keymaps (VSCode-like) ----------
nnoremap <leader>e :NERDTreeToggle<CR>      " Toggle file explorer
nnoremap <leader>f :Files<CR>               " Fuzzy file search
nnoremap <C-p> :Files<CR>
nnoremap <leader>g :Git<CR>                 " Git menu
nnoremap <leader>c :w<CR>                   " Save (Ctrl+S in VSCode)
nnoremap <leader>d :CocDiagnostics<CR>      " Show diagnostics/problems

" ---------- Coc (LSP & Autocomplete) ----------
" Tab for completion navigation
inoremap <silent><expr> <TAB>   coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter to confirm, otherwise newline
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Run C program with F5
autocmd FileType c nnoremap <F5> :w<CR>:!gcc % -o %:r && ./%:r<CR>
