-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require("nvim-navic")

navic.setup {
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
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
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
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

-- BrightScript LSP configuration with enhanced sync settings
require('lspconfig').bright_script.setup {
    capabilities = capabilities,
    settings = {
        brightscript = {
            diagnostics = {
                enabled = true,
            }
        }
    },
    flags = {
        debounce_text_changes = 50,  -- Much more aggressive updates
        allow_incremental_sync = false,  -- Force full document sync
    },
    -- Add handler for more immediate diagnostic updates
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                update_in_insert = true,  -- Update diagnostics even in insert mode
                virtual_text = true,      -- Show errors inline
                signs = true,             -- Show error signs in the gutter
                underline = true,         -- Underline errors
            }
        )
    },
}

-- Setup LSP completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup LSP completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').rust_analyzer.setup {
    capabilities = capabilities
}
require('lspconfig').pyright.setup{}

require'lspconfig'.clangd.setup{}
