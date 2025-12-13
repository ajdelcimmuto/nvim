vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.brs",
  command = "setfiletype brs"
})
