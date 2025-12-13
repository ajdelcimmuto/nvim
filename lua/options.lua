-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.textwidth = 400

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Folding
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 10

-- Files
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"

-- System integration
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 100

-- Whitespace visualization
vim.opt.list = true
vim.opt.listchars = {
    space = '·',
    tab = '· ',
    eol = '↵'
}

-- Syntax and filetype
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.indentexpr = "nvim_treesitter#indent()"

-- Custom filetype settings
vim.cmd([[
    autocmd FileType brs setlocal commentstring='\ %s
]])

-- Plugin-specific (consider moving to plugin config files)
vim.g.gitgutter_map_keys = 0
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- IMPORTANT: Must come after winbar setting
vim.opt.scroll = 10

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
