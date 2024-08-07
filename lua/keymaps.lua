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

map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", { noremap = true })
map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", { noremap = true })
map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", { noremap = true })
map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", { noremap = true })

map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", { noremap = true })
map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", { noremap = true })

map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", { noremap = true })
map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", { noremap = true })

map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", { noremap = true })
map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", { noremap = true })

map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true })
map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", { noremap = true })
map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })

map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", { noremap = true })
map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", { noremap = true })

-- Configure NERDTree
vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeToggle<CR>", { noremap = true })

-- Configure telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Go to previous buffer
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })

-- Open a new empty tab
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })

-- Go to the next tab
vim.api.nvim_set_keymap('n', '<leader>x', ':tabnext<CR>', { noremap = true, silent = true })

-- Go to the previous tab
vim.api.nvim_set_keymap('n', '<leader>z', ':tabprevious<CR>', { noremap = true, silent = true })

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

