" Set the leader key to space
let mapleader = " "

" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable mouse support
set mouse=a

" Set tab settings
set tabstop=4
set shiftwidth=4
set noexpandtab

" Enable autoindent
set autoindent

" Enable smart indentation
set smartindent

" Enable case-insensitive search
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Set the default encoding
set encoding=utf-8

" Disable swap files
set noswapfile

" Set the clipboard to use the system clipboard
set clipboard=unnamedplus

" Remap the Esc key to jk
inoremap jk <Esc>

" Add a key mapping to save the current file
nnoremap <leader>w :w<CR>

" Add a key mapping to quit Neovim
nnoremap <leader>q :q<CR>

" Install plugins using vim-plug
call plug#begin('~/.config/nvim/plugged')

" The catppuccin/nvim theme plugin
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" A file explorer plugin
Plug 'preservim/nerdtree'

" A fuzzy file finder plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" A status line plugin
Plug 'vim-airline/vim-airline'

" A roku support plugin
Plug 'neovim/nvim-lspconfig'
Plug 'entrez/roku.vim'

" Initialize plugin system
call plug#end()

" Set the color scheme
colorscheme catppuccin-mocha

" Configure NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Configure fzf
nnoremap <leader>f :Files<CR>

if executable('bsc')
  augroup brighterscript_lsp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'brighterscript',
      \ 'cmd': {server_info->['bsc', '-l']},
      \ 'allowlist': ['brighterscript', 'brightscript'],
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'bsconfig.json'))},
      \ 'workspace_config': {}
      \})
    autocmd FileType brighterscript,brightscript setlocal omnifunc=lsp#complete
  augroup end
endif
