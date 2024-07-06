vim.cmd([[

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
Plug 'folke/tokyonight.nvim'
Plug 'f-person/git-blame.nvim'
" Plug 'MrcJkb/haskell-tools.nvim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'tpope/vim-fugitive'  " Git integration
call plug#end()

set number
syntax on
set ttyfast
set expandtab
set hlsearch
set tabstop=4 softtabstop=4 shiftwidth=4
let g:airline#extensions#tabline#enabled = 1
set clipboard+=unnamedplus
let mapleader = " "
set encoding=UTF-8
set ignorecase
set smartcase
set incsearch
colorscheme rose-pine

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
nnoremap gr <cmd>BufferPrev<cr>

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
nnoremap <leader>` <Cmd>BufferClose<CR>
]])

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query","haskell","haskell_persistent" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
