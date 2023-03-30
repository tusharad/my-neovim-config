" Enable line numbers and relative line numbers
set number
set relativenumber

" Set tabs to be 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch " Highlight search results

set clipboard=unnamed

call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

let mapleader = " "
nnoremap tt :tabedit 
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
