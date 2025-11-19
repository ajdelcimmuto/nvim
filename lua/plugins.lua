-- Install plugins using vim-plug
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " theme plugins
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'folke/tokyonight.nvim'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'sainnhe/everforest'
  Plug 'sainnhe/sonokai'

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

  " Nvim DAP - debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-neotest/nvim-nio'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'folke/neodev.nvim'

  " Git diff view
  Plug 'sindrets/diffview.nvim'

  "git blame
  Plug 'f-person/git-blame.nvim'

  " Git show adds and subtracts
  Plug 'airblade/vim-gitgutter'

  " visualize tabs
  Plug 'lukas-reineke/indent-blankline.nvim'

  " comment plugin
  Plug 'tpope/vim-commentary'

  Plug 'nvim-tree/nvim-web-devicons'

  Plug 'RaafatTurki/hex.nvim'

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

  " obsidian support
  Plug 'epwalsh/obsidian.nvim'
  Plug 'nvim-lua/plenary.nvim'

  " large file editing
  Plug 'LunarVim/bigfile.nvim'

  Plug 'ThePrimeagen/vim-be-good'

  " Initialize plugin system
  call plug#end()
]])

-- Load individual plugin configurations
require('plugins.cmp')
require('plugins.lsp')
require('plugins.dap')
require('plugins.theme')
require('plugins.ibl')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.oil')
require('plugins.nvim-tree')
require('plugins.nvim-surround')
require('plugins.obsidian')
require('plugins.bigfile')
require('plugins.hex')
require('plugins.lualine')
