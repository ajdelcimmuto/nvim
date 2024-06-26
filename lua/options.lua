-- Set the leader key to space
vim.g.mapleader = " "

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false  -- Disable folding at startup.

-- Enable syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.indentexpr = "nvim_treesitter#indentexpr()"

vim.opt.scrolloff = 3
vim.opt.cursorline = true

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = false

-- Enable mouse support
vim.opt.mouse = "a"

-- Set tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd [[
  autocmd FileType brs setlocal tabstop=4 shiftwidth=4 expandtab commentstring='\ %s
]]

-- Enable autoindent
vim.opt.autoindent = true

-- Enable smart indentation
vim.opt.smartindent = true

-- Enable case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Enable incremental search
vim.opt.incsearch = true

-- Set the default encoding
vim.opt.encoding = "utf-8"

-- Disable swap files
vim.opt.swapfile = false

-- Set the clipboard to use the system clipboard
vim.opt.clipboard = "unnamedplus"

vim.wo.wrap = false

-- For gitgutter
vim.opt.updatetime = 100
vim.g.gitgutter_map_keys = 0

