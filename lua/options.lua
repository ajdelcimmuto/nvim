-- Set the leader key to space
vim.g.mapleader = " "

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false  -- Disable folding at startup.

-- Enable syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.indentexpr = "nvim_treesitter#indent()"

vim.opt.scrolloff = 3
vim.opt.cursorline = true

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Set tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.cmd [[
  autocmd FileType brs setlocal commentstring='\ %s
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

vim.opt.wrap = false
vim.opt.sidescrolloff=8
vim.opt.textwidth = 400
-- vim.opt.colorcolumn = "80"
vim.opt.linebreak = false

-- For gitgutter
vim.opt.updatetime = 100
vim.g.gitgutter_map_keys = 0

vim.opt.list = true
vim.opt.listchars = {
    space = '·',  -- Middle dot for spaces
    tab = '· ',    -- Vertical line for tabs, keeping ibl compatibility
    eol = '↵'
}

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Set scroll to 10 lines
-- Make sure this line goes after winbar!!!!
vim.opt.scroll = 10

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
	desc = 'Trim trailing white spaces and fix formatting',
	pattern = '*',
	callback = function()
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '<buffer>',
			callback = function()
				local curpos = vim.api.nvim_win_get_cursor(0)

				-- Trimm trailing whitespaces and remove multiple empty lines
				vim.cmd([[keeppatterns %s/\s\+$//e | keeppatterns %s/\n\{3,}/\r\r/e]])

				-- Remove all extra newlines at the end of the file and add one if missing
				vim.cmd([[keeppatterns %s/\n\+\%$//e | keeppatterns %s/\%$[^\n]/&\r/e]])

				vim.api.nvim_win_set_cursor(0, curpos)
			end,
		})
	end,
})
