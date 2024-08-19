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

-- map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", { noremap = true })
-- map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", { noremap = true })
-- map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", { noremap = true })
-- map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", { noremap = true })

-- map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", { noremap = true })
-- map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", { noremap = true })

-- map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", { noremap = true })
-- map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", { noremap = true })

-- map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", { noremap = true })
-- map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", { noremap = true })

-- map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true })
-- map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", { noremap = true })
-- map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })

-- map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", { noremap = true })
-- map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", { noremap = true })

-- Configure Oil
map("n", "-", ":lua require('oil').open_float('.')<CR>", { noremap = true, silent = true })

-- Configure telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- Telescope, but custom functionality for easy search while in visual mode
vim.keymap.set("v", "<leader>fg", '"zy<Cmd>lua require("telescope.builtin").grep_string({search=vim.fn.getreg("z")})<CR>')

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

local harpoon = require("harpoon")
harpoon:setup()

-- Add current file to Harpoon list
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- Toggle-- Remove current file from Harpoon list with detailed debug info
vim.keymap.set("n", "<leader>d", function()
    harpoon:list():remove()
    -- print_harpoon_list()
end, { desc = "Remove current file from Harpoon" })

vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Navigate to files in Harpoon list
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Optional: Quick navigation between next and previous Harpoon marks
-- vim.keymap.set("n", "<leader>n", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<leader>p", function() harpoon:list():next() end)

-- Git graph Key mapping
vim.api.nvim_set_keymap('n', '<leader>gl', [[<cmd>lua require('gitgraph').draw({}, { all = true, max_count = 5000 })<CR>]], { noremap = true, silent = true, desc = "GitGraph - Draw" })

-- Diffview Open
vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true, desc = "Diffview Open" })

-- Diffview Close
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true, desc = "Diffview Close" })
