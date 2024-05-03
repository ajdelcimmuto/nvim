-- Set the leader key to space
vim.g.mapleader = " "

-- Enable syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

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
  autocmd FileType roku,brs setlocal tabstop=4 shiftwidth=4 expandtab commentstring='\ %s
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

-- Remap the Esc key to jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Add a key mapping to save the current file
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true })

-- Add a key mapping to quit Neovim
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true })

-- vim.opt.foldenable = false

local map = vim.api.nvim_set_keymap
map("n", "<F4>", ":lua require('dapui').toggle()<CR>", { noremap = true })
map("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
map("n", "<F9>", ":lua require('dap').continue()<CR>", { noremap = true })

map("n", "<F1>", ":lua require('dap').step_over()<CR>", { noremap = true })
map("n", "<F2>", ":lua require('dap').step_into()<CR>", { noremap = true })
map("n", "<F3>", ":lua require('dap').step_out()<CR>", { noremap = true })

map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", { noremap = true })
map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", { noremap = true })
map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", { noremap = true })
map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", { noremap = true })

map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", { noremap = true })
map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", { noremap = true })

map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", { noremap = true })
map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", { noremap = true })

map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", { noremap = true })
map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", { noremap = true })

map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true })
map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", { noremap = true })
map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })

map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", { noremap = true })
map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", { noremap = true })

-- Configure NERDTree
vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeToggle<CR>", { noremap = true })

-- Configure fzf
vim.api.nvim_set_keymap("n", "<leader>f", ":Files<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>F', ':Rg<CR>', { noremap = true })

-- Open a new empty tab
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })

-- Go to the next tab
vim.api.nvim_set_keymap('n', '<leader>x', ':tabnext<CR>', { noremap = true, silent = true })

-- Go to the previous tab
vim.api.nvim_set_keymap('n', '<leader>z', ':tabprevious<CR>', { noremap = true, silent = true })

-- commenting
vim.keymap.set('n', '<leader>c', 'gcc', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>c', 'gc', { noremap = true, silent = true })

-- Definition key binds
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gb', vim.lsp.buf.references, { noremap = true, silent = true })

-- Install plugins using vim-plug
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " The catppuccin/nvim theme plugin
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

  " A file explorer plugin
  Plug 'preservim/nerdtree'

  " A fuzzy file finder plugin
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

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
  Plug 'ajdelcimmuto/roku.vim'

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

  " Initialize plugin system
  call plug#end()
]])

-- Set the color scheme
-- vim.cmd("colorscheme catppuccin-mocha")
vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme gruvbox")

vim.cmd [[
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='light'
  let g:airline_powerline_fonts = 1
]]

-- Lua configuration
-- require'lspconfig'.bright_script.setup{}

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').bright_script.setup {
    capabilities = capabilities
}

local dap = require('dap')
dap.adapters.brightscript = {
   type = 'executable',
   command = 'npx',
   args = { '--verbose', 'roku-debug', '--dap' },
}

dap.configurations.brs = {
   {
      type = 'brightscript',
      request = 'launch',
      name = "Debug app",
      rootDir = "${workspaceFolder}",
      files = {
         "manifest",
         "source/**/*.*",
         "components/**/*.*",
         "images/**/*.*",
         "locale/**/*.*"
      },
      host = "192.168.1.222",
      remotePort = 8060,
      password = "pluto",
      outDir = "${workspaceFolder}/out/",
      enableDebugProtocol = true,
      fileLogging = false,
      enableVariablesPanel = true,
      logLevel = "off"
   },
}

local dap, dapui = require("dap"), require("dapui")
-- dapui.setup()

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true }
})

-- Initialize DAP UI
dapui.setup({
  icons = { 
      expanded = "▾",
      collapsed = "▸",
      breakpoint = "🔴",
  },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 40,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- visualize tabs
require("ibl").setup()
