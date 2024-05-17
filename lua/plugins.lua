-- Install plugins using vim-plug
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " The catppuccin/nvim theme plugin
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

  " A file explorer plugin
  Plug 'preservim/nerdtree'

  " A fuzzy file finder plugin

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

  " A status line plugin
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " A roku support plugin
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  
  " Roku language support
  " Plug 'ajdelcimmuto/roku.vim'

  " Nvim DAP - debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-neotest/nvim-nio'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'folke/neodev.nvim'

  " Git diff view
  Plug 'sindrets/diffview.nvim'
  
  " visualize tabs
  Plug 'lukas-reineke/indent-blankline.nvim'
  
  " comment plugin
  Plug 'tpope/vim-commentary'

  Plug 'ellisonleao/gruvbox.nvim'

  Plug 'nvim-tree/nvim-web-devicons'

  Plug 'RaafatTurki/hex.nvim'

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

