vim.api.nvim_create_augroup('BinaryFiles', { clear = true })

vim.api.nvim_create_autocmd({ 'BufReadPre' }, {
  pattern = { '*.m4s' },
  callback = function()
    vim.cmd('silent execute "e ++bin %"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.m4s' },
  callback = function()
    vim.cmd('silent execute "%!xxd"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.m4s' },
  callback = function()
    vim.cmd('silent execute "%!xxd -r"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.m4s' },
  callback = function()
    vim.cmd('silent execute "%!xxd"')
  end,
  group = 'BinaryFiles',
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.brs",
  command = "setfiletype brs"
})

-- Function to format XML
vim.api.nvim_create_autocmd("FileType", {
  pattern = "xml",
  callback = function()
    -- Set up XML formatting command
    vim.api.nvim_buf_create_user_command(0, "FormatXML", function()
      -- Get buffer content
      local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

      -- Create temporary file
      local tmp = vim.fn.tempname()
      local f = io.open(tmp, 'w')
      f:write(content)
      f:close()

      -- Format using xmllint
      vim.fn.system(string.format("xmllint --format %s --output %s", tmp, tmp))

      -- Read formatted content
      local formatted = {}
      for line in io.lines(tmp) do
        table.insert(formatted, line)
      end

      -- Replace buffer content
      vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted)

      -- Clean up
      os.remove(tmp)
    end, {})

    -- Optional: Set up key mapping for the format command
    vim.keymap.set('n', '<leader>fx', ':FormatXML<CR>', { buffer = true, silent = true })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    -- Set up XML formatting command
	vim.api.nvim_buf_create_user_command(0, "FormatJSON", ":%!jq \'.\'", {})
  end
})

-- Set up the autocommand that will determine tabs or spaces on buffer open
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
		-- Determines whether to use spaces or tabs on the current buffer.
		if vim.fn.getfsize(vim.fn.bufname("%")) > 256000 then
			-- File is very large, just use the default.
			return
		end

		local numTabs = #vim.fn.filter(vim.fn.getbufline(vim.fn.bufname("%"), 1, 250), 'v:val =~ "^\\t"')
		local numSpaces = #vim.fn.filter(vim.fn.getbufline(vim.fn.bufname("%"), 1, 250), 'v:val =~ "^ "')

		if numTabs > numSpaces then
			vim.opt_local.expandtab = false
		else
			vim.opt_local.expandtab = true
		end
	end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 2
    end
})
