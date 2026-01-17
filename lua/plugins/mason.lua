-- Set up completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup Mason first
require("mason").setup()

-- Setup mason-lspconfig with automatic_enable
require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "pyright",
        "clangd",
        "ts_ls",
    },
    automatic_enable = true,
})

-- Configure each server using vim.lsp.config
vim.lsp.config('rust_analyzer', {
    capabilities = capabilities,
})

vim.lsp.config('pyright', {
    capabilities = capabilities,
})

vim.lsp.config('ts_ls', {
    capabilities = capabilities,
})

vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--clang-tidy=false"
    },
    root_markers = {
        'compile_commands.json',
        'build/compile_commands.json',
        '.git',
        'Makefile'
    },
    capabilities = capabilities,
})

-- Enable all configured LSP servers
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ts_ls')
