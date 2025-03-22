-- require('telescope').setup {
--     defaults = {
--         mappings = {
--             i = {
--                 ['<c-d>'] = require('telescope.actions').delete_buffer
--             }
--         },
--         path_display = { "tail" }  -- Add this line
--     }
-- }
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<c-d>'] = require('telescope.actions').delete_buffer,
                -- Add the following lines for quickfix functionality
                ["<Tab>"] = require("telescope.actions").toggle_selection,
                ["<C-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
            },
            n = {
                -- Normal mode mappings
                ["<Tab>"] = require("telescope.actions").toggle_selection,
                ["<C-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
            }
        },
        path_display = { "tail" }
    }
}
