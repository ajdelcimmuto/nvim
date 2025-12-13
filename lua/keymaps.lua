-- ============================================================================
-- Basic Keymaps
-- ============================================================================
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, desc = "Quit" })
vim.keymap.set('n', '<C-c>', "<cmd>close<cr>", { noremap = true, desc = "Close window" })

-- Center cursor after jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

-- ============================================================================
-- LSP
-- ============================================================================
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set('n', 'gb', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Go to references" })
vim.keymap.set('n', 'E', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show line diagnostics" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Next diagnostic" })

-- Switch between header/source (C/C++)
vim.keymap.set('n', '<leader>h', function()
  vim.lsp.buf_request(0, 'textDocument/switchSourceHeader', {
    uri = vim.uri_from_bufnr(0)
  }, function(err, result)
    if err then
      vim.notify('Error switching header/source: ' .. tostring(err), vim.log.levels.ERROR)
      return
    end
    if result then
      vim.cmd('edit ' .. vim.uri_to_fname(result))
    else
      vim.notify('No corresponding header/source file found', vim.log.levels.WARN)
    end
  end)
end, { noremap = true, silent = true, desc = "Switch header/source" })

-- ============================================================================
-- Oil (File Explorer)
-- ============================================================================
vim.keymap.set("n", "-", ":Oil --float --preview .<CR>", { noremap = true, silent = true, desc = "Open Oil" })

-- ============================================================================
-- Telescope (Fuzzy Finder)
-- ============================================================================
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
vim.keymap.set('n', '<leader>fm', ":Telescope harpoon marks<CR>", { desc = "Harpoon marks" })

-- Visual mode: grep selection
vim.keymap.set("v", "<leader>fg", '"zy<Cmd>lua require("telescope.builtin").grep_string({search=vim.fn.getreg("z")})<CR>', { desc = "Grep selection" })

-- Visual mode: search for selection in current buffer
vim.keymap.set("v", "<leader>fw", function()
    vim.cmd('normal! "zy')
    local escaped_text = vim.fn.escape(vim.fn.getreg('z'), '\\[].*^$')
    vim.fn.setreg('/', escaped_text)
    vim.cmd('normal! n')
    vim.opt.hlsearch = true
end, { noremap = true, silent = true, desc = "Search selection in buffer" })

-- ============================================================================
-- Git Gutter
-- ============================================================================
vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)', { silent = true, desc = "Next git hunk" })
vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)', { silent = true, desc = "Prev git hunk" })

-- ============================================================================
-- Undotree
-- ============================================================================
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- ============================================================================
-- FZF Configuration
-- ============================================================================
vim.g.fzf_action = {
  ['ctrl-v'] = 'vsplit',
  ['ctrl-x'] = 'split',
  ['ctrl-t'] = 'tab split',
}
