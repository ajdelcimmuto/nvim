require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<c-d>'] = require('telescope.actions').delete_buffer
			}
		}
		-- path_display = {
		-- 	truncate = 1
		-- }
	}
}
