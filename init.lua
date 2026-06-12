local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  -- Core Utilities
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function() require('telescope').setup{} end
  },

  -- Git Integration
  { "tpope/vim-fugitive" },
  { "f-person/git-blame.nvim" },
  { "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end },

  -- UI: Statusline & Buffer Tabs
  {
    "nvim-lualine/lualine.nvim",
    config = function() require('lualine').setup({ options = { theme = 'rose-pine' } }) end
  },
  {
    "romgrk/barbar.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function() vim.g.barbar_keymaps_suppress_errors = true end,
  },

  -- Themes
  { "rose-pine/neovim", name = "rose-pine" },
  { "folke/tokyonight.nvim" },
  { "ellisonleao/gruvbox.nvim" },

  {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" } 
      })
    end
  },
  -- Legacy Polyglot Pack (Provides instant base colors before LSP kicks in)
  { "sheerun/vim-polyglot" },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Modern Neovim 0.11+ compliant configuration strategy
      if vim.lsp.config then
        vim.lsp.config("lua_ls", {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
            },
          },
        })
        vim.lsp.enable("lua_ls")
      else
        -- Fallback for Neovim 0.10 and older
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
            },
          },
        })
      end
    end
  },

  -- Haskell Tools (Manages Haskell Language Server automatically)
  {
  'mrcjkb/haskell-tools.nvim',
  -- To avoid being surprised by breaking changes,
  -- I recommend you set a version range
  version = '^10',
  -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
  -- No need for lazy.nvim to lazy-load it.
  lazy = false,
  config = function()
      -- This initializes haskell-tools and attaches it to your buffers automatically
      require('haskell-tools')
    end
    },

  { "ndmitchell/ghcid", rtp = "plugins/nvim" },
})

local opt = vim.opt

vim.cmd("syntax on") 
opt.number = true
opt.expandtab = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.termguicolors = true      

vim.cmd("colorscheme rose-pine")

local keymap = vim.keymap.set

-- Standard Clipboard Mappings
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+yg_')
keymap("n", "<leader>y", '"+y')
keymap("n", "<leader>yy", '"+yy')
keymap("n", "<leader>p", '"+p')
keymap("n", "<leader>P", '"+P')
keymap("v", "<leader>p", '"+p')
keymap("v", "<leader>P", '"+P')

-- Telescope (Fixed)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- Fixed here
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Barbar Navigation (Fixed)
keymap("n", "gt", "<cmd>BufferNext<cr>")
keymap("n", "gr", "<cmd>BufferPrev<cr>")
keymap("n", "<leader>1", "<cmd>BufferGoto 1<cr>")
keymap("n", "<leader>2", "<cmd>BufferGoto 2<cr>")
keymap("n", "<leader>3", "<cmd>BufferGoto 3<cr>")
keymap("n", "<leader>4", "<cmd>BufferGoto 4<cr>")
keymap("n", "<leader>5", "<cmd>BufferGoto 5<cr>")
keymap("n", "<leader>6", "<cmd>BufferGoto 6<cr>")
keymap("n", "<leader>7", "<cmd>BufferGoto 7<cr>")
keymap("n", "<leader>8", "<cmd>BufferGoto 8<cr>") -- Fixed here
keymap("n", "<leader>9", "<cmd>BufferGoto 9<cr>")
keymap("n", "<leader>0", "<cmd>BufferLast<cr>")
keymap("n", "<leader>`", "<cmd>BufferClose<cr>")

-- Essential IDE/LSP Mappings 
keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
keymap('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
keymap('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Code Rename" })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic Error" })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic Error" })
