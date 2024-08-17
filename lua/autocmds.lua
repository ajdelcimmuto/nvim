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

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.brs",
  command = "setfiletype brs"
})
