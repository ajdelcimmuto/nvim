vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.brs",
  command = "setfiletype brs"
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.cpp", "*.h" },
    callback = function ()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})
