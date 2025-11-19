-- Set up completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up nvim-navic
local navic = require("nvim-navic")
navic.setup {
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
        return text
    end,
}

-- BrightScript LSP configuration
vim.lsp.config('bright_script', {
    cmd = { 'bsc', '--lsp', '--stdio' }, -- Adjust command as needed
    root_markers = { 'bsconfig.json', 'makefile', '.git' },
    capabilities = capabilities,
    settings = {
        brightscript = {
            diagnostics = {
                enabled = true,
            }
        }
    },
    flags = {
        debounce_text_changes = 50,
        allow_incremental_sync = false,
    },
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                update_in_insert = true,
                virtual_text = true,
                signs = true,
                underline = true,
            }
        )
    },
})

-- Rust Analyzer configuration
vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    root_markers = { 'Cargo.toml', '.git' },
    capabilities = capabilities,
})

-- Pyright configuration
vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
    capabilities = capabilities,
})

-- Clangd configuration
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index=false",
        "--clang-tidy=false",
        "--completion-style=bundled",
        "--header-insertion=never",
        "--pch-storage=memory",
        "--limit-results=20",
        "--limit-references=100",
        "--malloc-trim",
    },
    root_markers = { 'compile_commands.json', '.git', 'Makefile' },
    capabilities = capabilities,
})

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    capabilities = capabilities,
})

-- Enable all configured LSP servers
vim.lsp.enable('bright_script')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('ts_ls')
