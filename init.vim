"my neovim config

call plug#begin()
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sharkdp/fd'
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'ryanoasis/vim-devicons'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lewis6991/gitsigns.nvim' 
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'rose-pine/neovim'
Plug 'f-person/git-blame.nvim'
call plug#end()

set number
set relativenumber
syntax on
set ttyfast
set expandtab
set hlsearch
set tabstop=2 softtabstop=2 shiftwidth=2
set background=dark 
colorscheme rose-pine
let g:airline#extensions#tabline#enabled = 1
set clipboard+=unnamedplus
let mapleader = " "
set encoding=UTF-8
set ignorecase
set smartcase
set incsearch

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" barbar config
nnoremap gt <cmd>BufferNext<cr>
nnoremap gr <cmd>BufferNext<cr>

nnoremap <leader>1 <cmd>BufferGoto 1<cr>
nnoremap <leader>2 <cmd>BufferGoto 2<cr>
nnoremap <leader>3 <cmd>BufferGoto 3<cr>
nnoremap <leader>4 <cmd>BufferGoto 4<cr>
nnoremap <leader>5 <cmd>BufferGoto 5<cr>
nnoremap <leader>6 <cmd>BufferGoto 6<cr>
nnoremap <leader>7 <cmd>BufferGoto 7<cr>
nnoremap <leader>8 <cmd>BufferGoto 8<cr>
nnoremap <leader>9 <cmd>BufferGoto 9<cr>
nnoremap <leader>0 <cmd>BufferLast<cr>
