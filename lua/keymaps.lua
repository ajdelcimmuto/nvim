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

-- Configure Oil
map("n", "-", ":lua require('oil').open_float('.')<CR>", { noremap = true, silent = true })

-- Configure telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', ":Telescope harpoon marks<CR>", {})
-- Telescope, but custom functionality for easy search while in visual mode
vim.keymap.set("v", "<leader>fg", '"zy<Cmd>lua require("telescope.builtin").grep_string({search=vim.fn.getreg("z")})<CR>')
vim.keymap.set("v", "<leader>fw", function()
    -- Yank the selected text into the 'z' register
    vim.cmd('normal! "zy')

    -- Escape special characters in the search pattern
    local escaped_text = vim.fn.escape(vim.fn.getreg('z'), '\\[].*^$')

    -- Set the search register with the escaped text
    vim.fn.setreg('/', escaped_text)

    -- Trigger the search
    vim.cmd('normal! n')

    -- Turn on search highlighting
    vim.opt.hlsearch = true
end, { noremap = true, silent = true })

-- Go to previous buffer
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })

-- Open a new empty tab
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })

-- commenting
vim.keymap.set('n', '<leader>c', 'gcc', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>c', 'gc', { noremap = true, silent = true })

-- Definition key binds
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gb', vim.lsp.buf.references, { noremap = true, silent = true })

vim.g.fzf_action = {
  ['ctrl-v'] = 'vsplit',
  ['ctrl-x'] = 'split',
  ['ctrl-t'] = 'tab split',
}

vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Paste override
-- Preserve yanked text when pasting in visual mode
vim.keymap.set('x', 'p', [["_dP]])

-- Optional: Also preserve when using capital P
vim.keymap.set('x', 'P', [["_dP]])

-- HARPOON
local harpoon = require("harpoon")
harpoon:setup()
-- Add current file to Harpoon list
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Navigate to files in Harpoon list
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)

-- Optional: Quick navigation between next and previous Harpoon marks
vim.keymap.set("n", "<leader>n", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>p", function() harpoon:list():next() end)

-- Git graph Key mapping
vim.api.nvim_set_keymap('n', '<leader>gl', [[<cmd>lua require('gitgraph').draw({}, { all = true, max_count = 5000 })<CR>]], { noremap = true, silent = true, desc = "GitGraph - Draw" })

-- Git gutter navigate hunks
vim.api.nvim_set_keymap('n', ']h', '<Plug>(GitGutterNextHunk)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '[h', '<Plug>(GitGutterPrevHunk)', {noremap = false, silent = true})

-- Diffview Open
vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true, desc = "Diffview Open" })

-- Diffview Close
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true, desc = "Diffview Close" })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Quick commands for Obsidian functionality
vim.keymap.set('n', '<leader>zb', ':ObsidianBacklinks<CR>', { desc = 'Show backlinks' })
vim.keymap.set('n', '<leader>zt', ':ObsidianToday<CR>', { desc = 'Open today\'s note' })
vim.keymap.set('n', '<leader>zy', ':ObsidianYesterday<CR>', { desc = 'Open yesterday\'s note' })
vim.keymap.set('n', '<leader>zs', ':ObsidianSearch<CR>', { desc = 'Search notes' })
vim.keymap.set('n', '<leader>zn', ':ObsidianNew<CR>', { desc = 'Create new note' })
vim.keymap.set('n', '<leader>zf', ':ObsidianFollowLink<CR>', { desc = 'Follow link under cursor' })
vim.keymap.set('n', '<leader>zo', ':ObsidianOpen<CR>', { desc = 'Open in Obsidian app' })

-- Telescope integration for fuzzy finding notes
vim.keymap.set('n', '<leader>fnn', ':Telescope find_files cwd=~/Notes<CR>', { desc = 'Find notes' })
vim.keymap.set('n', '<leader>fng', ':Telescope live_grep cwd=~/Notes<CR>', { desc = 'Grep notes' })
