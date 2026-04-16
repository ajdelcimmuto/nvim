-- nvim-treesitter rewrite (requires Neovim 0.12)
-- The plugin is now just a parser manager; highlighting/indent/fold are native Neovim features.
require('nvim-treesitter').setup({
    ensure_install = {
        'lua', 'python', 'javascript', 'typescript', 'rust', 'go',
        'bash', 'json', 'yaml', 'toml', 'markdown', 'markdown_inline',
        'html', 'css', 'vim', 'vimdoc', 'query',
    },
})

-- Enable treesitter highlighting (now built into Neovim)
vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- Treesitter-based folding (native Neovim API)
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false -- don't fold on open

-- Incremental selection is now built into Neovim 0.12 via text objects an/in/]n/[n
vim.keymap.set('n', '<CR>', 'van', { remap = true, desc = 'Start treesitter selection' })
vim.keymap.set('x', '<TAB>', 'an', { remap = true, desc = 'Expand treesitter selection' })
vim.keymap.set('x', '<S-TAB>', 'in', { remap = true, desc = 'Shrink treesitter selection' })

vim.treesitter.language.register('brightscript', 'brs')
