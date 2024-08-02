vim.api.nvim_create_augroup('BinaryFiles', { clear = true })

vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
  pattern = { '*.m4s', '*.ts' },
  callback = function()
    vim.cmd('silent execute "e ++bin %"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.m4s', '*.ts' },
  callback = function()
    vim.cmd('silent execute "%!xxd"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.m4s', '*.ts' },
  callback = function()
    vim.cmd('silent execute "%!xxd -r"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.m4s', '*.ts' },
  callback = function()
    vim.cmd('silent execute "%!xxd"')
  end,
  group = 'BinaryFiles',
})

-- vim.api.nvim_create_augroup("auto_eof_newline", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = "auto_eof_newline",
--     callback = function()
--         if vim.bo.binary then return end
--         local save_cursor = vim.api.nvim_win_get_cursor(0)
--         local last_line = vim.fn.line("$")
--         if vim.fn.getline(last_line) ~= "" then
--             vim.api.nvim_buf_set_lines(0, last_line, last_line, false, { "" })
--         end
--         vim.api.nvim_win_set_cursor(0, save_cursor)
--     end,
-- })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.brs",
  command = "setfiletype brs"
})

