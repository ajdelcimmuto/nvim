require("conform").setup({
    formatters_by_ft = {
        cpp = { "clang-format" },
        c = { "clang-format" },
    },
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
    },
})
