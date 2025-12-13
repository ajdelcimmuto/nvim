-- Install plugins using vim-plug
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " theme plugins
  Plug 'folke/tokyonight.nvim'

  " A file explorer plugin
  Plug 'stevearc/oil.nvim'
  Plug 'nvim-tree/nvim-tree.lua'

  " A fuzzy file finder plugin
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

  " A status line plugin
  Plug 'nvim-lualine/lualine.nvim'

  " A roku support plugin
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " statusline/winbar
  Plug 'SmiteshP/nvim-navic'

  Plug 'nvim-neotest/nvim-nio'
  Plug 'folke/neodev.nvim'

  "git blame
  Plug 'f-person/git-blame.nvim'

  " Git show adds and subtracts
  Plug 'airblade/vim-gitgutter'

  " visualize tabs
  Plug 'lukas-reineke/indent-blankline.nvim'

  " comment plugin
  Plug 'tpope/vim-commentary'

  Plug 'nvim-tree/nvim-web-devicons'

  " mutliple cursors for changing occurances
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Tmux
  Plug 'christoomey/vim-tmux-navigator'

  "Formatter for json
  Plug 'sbdchd/neoformat'

  " undo redo tree
  Plug 'mbbill/undotree'

  " Harpoon
  Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }

  " nvim surround
  Plug 'kylechui/nvim-surround'

  Plug 'ThePrimeagen/vim-be-good'

  " Initialize plugin system
  call plug#end()
]])

-- Set leader key before loading any configs
vim.g.mapleader = " "

-- Load individual plugin configurations
require('plugins.cmp')
require('plugins.lsp')
require('plugins.theme')
require('plugins.ibl')
require('plugins.harpoon')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.oil')
require('plugins.nvim-tree')
require('plugins.nvim-surround')
require('plugins.lualine')
