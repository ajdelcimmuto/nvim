require('telescope').setup({
    defaults = {
        path_display = { "tail" },
        preview = {
            treesitter = false,
        },
        mappings = {
            i = {
                ['<C-n>'] = require('telescope.actions').move_selection_next,
                ['<C-p>'] = require('telescope.actions').move_selection_previous,
                ['<C-y>'] = require('telescope.actions').select_default,
            },
        },
    },
})
